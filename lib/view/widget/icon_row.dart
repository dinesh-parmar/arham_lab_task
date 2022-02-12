import 'package:flutter/material.dart';

class IconRow extends StatelessWidget {
  const IconRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/icons/fb_icon.png",
          height: 30,
          width: 30,
        ),
        const SizedBox(width: 20),
        Image.asset(
          "assets/icons/google_icon.png",
          height: 30,
          width: 30,
        )
      ],
    );
  }
}
