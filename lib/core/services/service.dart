import 'package:dio/dio.dart';

abstract class Service {
  abstract Dio client;
  abstract String baseUrl;
}