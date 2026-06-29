import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wiki_bricks/core/api/api_client.dart';
import 'package:wiki_bricks/core/services/theme.service.dart';
import 'package:wiki_bricks/features/sets/services/set.service.dart';
import '/core/services/auth.service.dart';

List<SingleChildWidget> providers = [
  Provider(create: (_) => ApiClient()),
  Provider(create: (context) => ThemeService(client: context.read<ApiClient>().client)),
  Provider(create: (context) => SetService(client: context.read<ApiClient>().client)),
  ChangeNotifierProvider(create: (context) => AuthService(client: context.read<ApiClient>().client)),
];