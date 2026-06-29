import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/services/auth.service.dart';
import '../features/layout_screen.dart';
import '../features/profile/profile_menu.dart';
import '../features/sets/cubit/sets_cubit.dart';
import '../features/sets/repositories/set.repository.dart';
import '../features/sets/views/all_sets_view.dart';
import '../core/routes.dart';
import '../features/home/home_menu.dart';
import '../features/home/home_view_model.dart';
import '../features/auth/login_screen.dart';
import '../features/auth/login_view_model.dart';

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
              builder: (context, state) => HomeMenu(
                viewModel: HomeViewModel(themeService: context.read()),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.sets,
              builder: (context, state) => BlocProvider(
                create: (_) => SetsCubit(
                  repository: SetRepository(service: context.read()),
                )..getAllSets(),
                child: const AllSetsView(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) => const ProfileMenu(),
            ),
          ],
        ),
      ],
    ),
  ],
);
