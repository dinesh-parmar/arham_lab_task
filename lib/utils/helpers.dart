import 'package:dio/dio.dart';
import 'package:get/get.dart';

String? Function(String? value) emailValidator() => (String? value) {
      ///Email Validator Function which will be called by validator parameter in TextFormField
      if (value != null && value.isEmpty) {
        return "This Field is mandatory";
      }
      if (!GetUtils.isEmail(value ?? "")) {
        return "Please Enter Valid Email";
      }
      return null;
    };

Dio buildDio() {
  ///Building Dio which will help in intercepting the connections and debugging data.
  final dio = Dio();
  dio.interceptors.add(LogInterceptor(responseBody: true));
  return dio;
}
