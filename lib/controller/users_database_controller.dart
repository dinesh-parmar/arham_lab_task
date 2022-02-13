import 'dart:convert';
import 'package:arham_labs/model/common/user.dart';
import 'package:arham_labs/utils/common_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';

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
    Get.dialog(const AlertDialog(content: SizedBox(height: 100, child: centeredProgressIndicator))); //Show Progress Dialog
    usersDatabase.add(jsonEncode(user));
    await prefs.setStringList('usersDatabase', usersDatabase);
    await Future.delayed(300.milliseconds);
    Get.back(); //Get back from Progress Dialog
    showSimpleDialog("User Registered", message: "Thank you for registering with us. You can now proceed to Login");
    // print("new Database is ${prefs.getStringList('usersDatabase')}");
  }

  String? checkIfAlreadyExist(String emaild) {
    /// To be used in validator when signing up. It will check whether user email is already in the database
    final index = usersDatabase.indexWhere((element) => jsonDecode(element)["emailId"] == emaild);
    if (index != -1) return "This E-mail Already Exist";
    return null;
  }

  int findUser(User user) => usersDatabase.indexWhere((element) => User.fromJson(Map<String, String>.from(jsonDecode(element))) == user);
}
