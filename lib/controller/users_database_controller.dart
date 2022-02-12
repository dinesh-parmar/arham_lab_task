import 'dart:convert';

import 'package:arham_labs/model/common/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersDatabase extends GetxController {
  late final SharedPreferences prefs;
  final usersDatabase = <String>[].obs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    usersDatabase(prefs.getStringList('usersDatabase') ?? []);
    // print("UsersDatabase is $usersDatabase");
  }

  void registerUser(User user) async {
    usersDatabase.add(jsonEncode(user));
    await prefs.setStringList('usersDatabase', usersDatabase);
    print("new Database is ${prefs.getStringList('usersDatabase')}");
  }

  int findUser(User user) => usersDatabase.indexWhere((element) => User.fromJson(Map<String, String>.from(jsonDecode(element))) == user);
}
