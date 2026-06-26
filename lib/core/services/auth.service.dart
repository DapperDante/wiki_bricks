import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final Dio _client;
  AuthService({required this._client});
  final String _baseUrl = '/users';
  Future<bool> login(String username, String password) async {
    try {
      final response = await _client.post(
        '$_baseUrl/_token',
        data: {'username': username, 'password': password},
      );
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
