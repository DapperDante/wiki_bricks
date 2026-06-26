import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wiki_bricks/core/services/auth.service.dart';
import 'package:wiki_bricks/ui/layout_screen.dart';
import 'package:wiki_bricks/ui/profile/profile_menu.dart';
import '/core/routes.dart';
import '../ui/home/home_menu.dart';
import '/ui/home/home_view_model.dart';
import '/ui/auth/login_screen.dart';
import '/ui/auth/login_view_model.dart';

GoRouter appRouter({required AuthService authService}) => GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) =>
          LoginScreen(viewModel: LoginViewModel(authService: context.read())),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, _, navigationShell) =>
          LayoutScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) =>
                  const HomeMenu(viewModel: HomeViewModel()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) =>
                  const ProfileMenu(),
            ),
          ],
        ),
      ],
    ),
  ],
);
