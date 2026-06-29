import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../features/minifigs/services/minifig.service.dart';
import '../core/api/api_client.dart';
import '../features/sets/services/set.service.dart';
import '../features/themes/services/theme.service.dart';
import '../core/services/auth.service.dart';

List<SingleChildWidget> providers = [
  Provider(create: (_) => ApiClient()),
  Provider(create: (context) => ThemeService(client: context.read<ApiClient>().client)),
  Provider(create: (context) => SetService(client: context.read<ApiClient>().client)),
  Provider(create: (context) => MinifigService(client: context.read<ApiClient>().client)),
  ChangeNotifierProvider(create: (context) => AuthService(client: context.read<ApiClient>().client)),
];