import 'package:flutter/material.dart';

class LoginPageBottomPart extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoginPage;

  const LoginPageBottomPart({Key? key, required this.onPressed, this.isLoginPage = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          height: 60,
          child: Container(
            color: const Color(0xffE9E8E9),
            width: double.infinity,
          ),
        ),
        Positioned(
          bottom: 60,
          left: 20,
          child: Visibility(
            visible: isLoginPage,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Forget Password?",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 35,
          child: RawMaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            fillColor: isLoginPage ? const Color(0xffF2C94C) : const Color(0xffEB5757),
            onPressed: onPressed,
            padding: const EdgeInsets.all(5),
            child: const Icon(
              Icons.trending_flat,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
