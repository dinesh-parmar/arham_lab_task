import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

void showSimpleDialog(String title, {String? message}) => Get.dialog(
      AlertDialog(
        title: Text(title),
        content: message != null ? Text(message) : null,
        actions: [TextButton(onPressed: () => Get.back(), child: const Text("Okay"))],
      ),
    );

Future<bool?> showCofirmationDialog(String title, {String? message}) => Get.dialog<bool>(AlertDialog(
      title: Text(title),
      content: message != null ? Text(message) : null,
      actions: [
        TextButton(onPressed: () => Get.back(result: true), child: const Text("Yes")),
        TextButton(onPressed: () => Get.back(result: false), child: const Text("No")),
      ],
    ));
