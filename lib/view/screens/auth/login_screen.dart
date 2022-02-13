import 'package:arham_labs/controller/user_controller.dart';
import 'package:arham_labs/controller/users_database_controller.dart';
import 'package:arham_labs/model/common/user.dart';
import 'package:arham_labs/utils/common_dialogs.dart';
import 'package:arham_labs/utils/constants.dart';
import 'package:arham_labs/utils/helpers.dart';
import 'package:arham_labs/view/widget/av_text_field.dart';
import 'package:arham_labs/view/widget/icon_row.dart';
import 'package:arham_labs/view/widget/login_page_bottom_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///Login Screen
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _userController = Get.put(UserController());
  final _formKey = GlobalKey<FormState>();
  final _userDatabaseController = Get.put(UsersDatabase());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text.rich(
            TextSpan(
                text: "Welcome Back, \n",
                children: [
                  TextSpan(text: "Rebbeca", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
                style: TextStyle(fontSize: 40)),
          ),
        ),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AVTextField(
                      controller: _emailController,
                      label: "Email address",
                      validator: emailValidator(),
                      maxLength: 20,
                      inputType: TextInputType.emailAddress,
                      formatters: commonInputFormatter,
                    ),
                    commonSpace,
                    AVTextField(
                      controller: _passwordController,
                      label: "Password",
                      maxLength: 8,
                      obscureText: true,
                      formatters: commonInputFormatter,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "This Field is mandatory";
                        } else if (value != null && value.length < 5) {
                          return "Password length should be atleast 5 characters";
                        }
                      },
                    ),
                    commonSpace,
                    const IconRow(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: LoginPageBottomPart(
            onPressed: () {
              if (_formKey.currentState?.validate() != true) return;
              final tryingUser = User(emailId: _emailController.text, password: _passwordController.text);
              final userId = _userDatabaseController.findUser(tryingUser);
              print("Got User id is $userId");
              if (userId == -1) {
                showSimpleDialog("Invalid User", message: "Sorry, We can't find you in our database. Please register if you are new.");
              } else {
                _userController.login(tryingUser, userId, shouldNavigateToHome: true);
              }
            },
          ),
        ),
      ],
    );
  }
}
