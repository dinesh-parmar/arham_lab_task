import 'dart:convert';

import 'package:arham_labs/model/responses/content_detail.dart';
import 'package:arham_labs/model/responses/content_home.dart';
import 'package:arham_labs/utils/constants.dart';
import 'package:arham_labs/utils/helpers.dart';
import 'package:arham_labs/utils/extensions.dart';
import 'package:dio/dio.dart';

class ContentApi {
  static const _contentHomePath = "/content_home";
  static const _contentDetailPath = "/content_detail";
  final dio = buildDio();

  Future<ContentHome> getContentHomeData() async {
    final resp = await dio.get(getUrlForService(_contentHomePath));
    return ContentHome.fromJson(resp.data);
  }

  Future<ContentDetail> getContentDetail() async {
    final resp = await dio.get(getUrlForService(_contentDetailPath), options: Options(responseType: ResponseType.plain));
    return ContentDetail.fromRawJson(resp.data.toString().removeTrailingCommas());
  }
}
