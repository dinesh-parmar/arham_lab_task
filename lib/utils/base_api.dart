import 'package:arham_labs/model/general_response.dart';
import 'package:dio/dio.dart';

mixin BaseApi {
  /// This mixin has a method which will typecast [T] object from API to [GeneralResponse] with [T] as the generic
  Future<GeneralResponse<T>> loadResponse<T>(Future<T> Function() executor) async {
    GeneralResponse<T> resp;
    try {
      resp = GeneralResponse(data: await executor(), statusCode: 200, success: true);
    } on DioError catch (e) {
      resp = GeneralResponse(statusCode: e.response?.statusCode ?? 400, dioError: e, success: false);
    }
    return resp;
  }
}
