import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wiki_bricks/core/api/api_client.dart';
import '/core/services/auth.service.dart';

List<SingleChildWidget> providers = [
  Provider(create: (_) => ApiClient()),
  ChangeNotifierProvider(create: (context) => AuthService(client: context.read<ApiClient>().client))
];