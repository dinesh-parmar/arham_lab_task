import 'package:arham_labs/model/common/user.dart';
import 'package:arham_labs/utils/common_dialogs.dart';
import 'package:arham_labs/utils/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  final userData = User().obs;
  late final SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    // prefs.clear();
  }

  void login(User user, int userId, {bool shouldNavigateToHome = false}) {
    userData(user);
    prefs.setString('userData', user.toJson().toString());
    if (kDebugMode) print("Login User $userId");
    prefs.setInt('userId', userId);
    if (shouldNavigateToHome) {
      Get.offNamedUntil(Routes.home, (routes) => false);
    }
  }

  bool checkAlreadyLogin() {
    if (kDebugMode) print("User id is ${prefs.getInt('userId')}");
    return prefs.containsKey('userId');
  }

  void logout() async {
    final shouldLogout = await showCofirmationDialog("Logout?", message: "Are you sure you want to logout?");
    if (shouldLogout == true) {
      prefs.remove('userId');
      prefs.remove('userData');
      Get.offNamedUntil(Routes.home, (route) => false);
    }
  }
}
