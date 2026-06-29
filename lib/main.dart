import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'config/providers.dart';
import 'config/theme.config.dart';
import 'core/router.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: providers,
    child: Builder(
      builder: (context) => MaterialApp.router(
        routerConfig: appRouter(authService: context.read()),
        theme: ThemeCustom.lightTheme,
        darkTheme: ThemeCustom.darkTheme,
      ),
    ),
  );
}
