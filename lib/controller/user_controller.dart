import 'package:arham_labs/model/common/user.dart';
import 'package:arham_labs/utils/routes.dart';
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
    print("Login User $userId");
    prefs.setInt('userId', userId);
    if (shouldNavigateToHome) {
      Get.offNamedUntil(Routes.home, (routes) => false);
    }
  }

  bool checkAlreadyLogin() {
    if (prefs.containsKey('userId')) print("Found User ${prefs.getInt('userId')}");
    return prefs.containsKey('userId');
  }
}
