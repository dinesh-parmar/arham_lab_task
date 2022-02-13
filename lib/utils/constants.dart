import 'package:arham_labs/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const centeredProgressIndicator = Center(child: CircularProgressIndicator(color: Colors.black));
final defaultDuration = 300.milliseconds;
final commonInputFormatter = [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9_@./#&+-]")), FilteringTextInputFormatter.deny(" ")];
const commonSpace = SizedBox(height: 20);

String getUrlForService(String path) {
  const getBaseUrl = "http://demo2142051.mockable.io";
  return getBaseUrl + path;
}

class TextStyles {
  TextStyles._();
  static const boldHeadline = TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32);
  static const boldBodyText = TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25);
}
