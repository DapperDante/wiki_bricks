import 'package:flutter/material.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});
  final LoginViewModel viewModel;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;
  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.viewModel.login(_username, _password);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Login')),
    body: Form(
      key: _formKey,
      child: Column(
        spacing: 10,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Username'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
            onSaved: (value) => _username = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            onSaved: (value) => _password = value!,
          ),
          ElevatedButton.icon(
            onPressed: _onLoginPressed,
            icon: Icon(Icons.login),
            label: Text('Login'),
          ),
        ],
      ),
    ),
  );
}
