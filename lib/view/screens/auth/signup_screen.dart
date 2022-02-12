import 'package:arham_labs/controller/users_database_controller.dart';
import 'package:arham_labs/model/common/user.dart';
import 'package:arham_labs/utils/constants.dart';
import 'package:arham_labs/utils/helpers.dart';
import 'package:arham_labs/view/widget/av_text_field.dart';
import 'package:arham_labs/view/widget/icon_row.dart';
import 'package:arham_labs/view/widget/login_page_bottom_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key, required this.onRegistered}) : super(key: key);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passAgainController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final userDatabaseController = Get.put(UsersDatabase());
  final VoidCallback onRegistered;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text.rich(
              TextSpan(
                text: "Hello ",
                children: [
                  TextSpan(text: "Beautiful,\n", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "Enter your informations below or login with a social account", style: TextStyle(fontSize: 20)),
                ],
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AVTextField(
                      label: "Email address",
                      controller: _emailController,
                      validator: (value) {
                        if (emailValidator()(value) == null) {
                          return userDatabaseController.checkIfAlreadyExist(value!);
                        }
                        return null;
                      },
                      maxLength: 20,
                      inputType: TextInputType.emailAddress,
                      formatters: commonInputFormatter,
                    ),
                    AVTextField(
                      controller: _passwordController,
                      label: "Password",
                      formatters: commonInputFormatter,
                      obscureText: true,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "This Field is mandatory";
                        } else if (value != null && value.length < 5) {
                          return "Password length should be atleast 5 characters";
                        }
                      },
                      maxLength: 8,
                    ),
                    AVTextField(
                      controller: _passAgainController,
                      label: "Password again",
                      autovalidateMode: AutovalidateMode.disabled,
                      obscureText: true,
                      formatters: commonInputFormatter,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "This is mandatory field";
                        } else if (value != null && value != _passwordController.text) {
                          return "Password doesn't match";
                        }
                      },
                      maxLength: 8,
                    ),
                    commonSpace,
                    const IconRow(),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: LoginPageBottomPart(
              onPressed: () {
                if (_formKey.currentState?.validate() != true) return;
                final newUser = User(emailId: _emailController.text, password: _passwordController.text);
                userDatabaseController.registerUser(newUser);
                onRegistered();
                emptyTexFields();
              },
              isLoginPage: false,
            ),
          ),
        ],
      ),
    );
  }

  void emptyTexFields() {
    _emailController.clear();
    _passwordController.clear();
    _passAgainController.clear();
  }
}
