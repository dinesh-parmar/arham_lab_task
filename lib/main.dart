import 'dart:ui';

import 'package:arham_labs/controller/user_controller.dart';
import 'package:arham_labs/utils/routes.dart';
import 'package:arham_labs/view/screens/auth/login_home_page.dart';
import 'package:arham_labs/view/screens/content_detail_screen.dart';
import 'package:arham_labs/view/screens/homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _userController = Get.put(UserController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: kIsWeb ? MyCustomScrollBehavior() : null,
      title: "Arham Labs Task",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: Routes.home, page: () => _userController.checkAlreadyLogin() ? HomePage() : const LoginHomePage()),
        GetPage(name: Routes.contentPage, page: () => ContentDetailScreen()),
      ],
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  /// ScrollBehaviour for Web. Mouse tap and drag can be used to scroll across Horizontal Axis
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
