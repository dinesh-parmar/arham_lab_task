import 'package:arham_labs/utils/common_dialogs.dart';
import 'package:dio/dio.dart';

class GeneralResponse<T> {
  /// GeneralResponse will be used for creating a object with [data] having the response dart model.
  final T? data;
  final int? statusCode;
  final bool? success;
  final DioError? dioError;

  GeneralResponse({this.data, this.statusCode, this.success, this.dioError});

  void showErrorDialog() => showSimpleDialog("Status Code: $statusCode", message: dioError?.message ?? "Something went wrong");
}
