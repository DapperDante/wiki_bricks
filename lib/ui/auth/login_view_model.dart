import 'package:wiki_bricks/core/services/auth.service.dart';

class LoginViewModel {
  const LoginViewModel({required this._authService});
  final AuthService _authService;
  Future<bool> login(String username, String password) async {
    return await _authService.login(username, password);
  }
}