import 'package:dio/dio.dart';
import 'package:get/get.dart';

String? Function(String? value) emailValidator() => (String? value) {
      if (value != null && value.isEmpty) {
        return "This Field is mandatory";
      }
      if (!GetUtils.isEmail(value ?? "")) {
        return "Please Enter Valid Email";
      }
      return null;
    };

Dio buildDio() {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor(responseBody: true));
  return dio;
}
