import 'package:arham_labs/utils/constants.dart';
import 'package:arham_labs/view/screens/auth/login_screen.dart';
import 'package:arham_labs/view/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({Key? key}) : super(key: key);

  @override
  State<LoginHomePage> createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  static const _tabs = [Tab(text: "Login"), Tab(text: "Sign Up")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            commonSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    tabs: _tabs,
                    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    padding: const EdgeInsets.only(left: 10),
                    indicator: const UnderlineTabIndicator(borderSide: BorderSide(width: 1)),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    labelStyle: const TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xffEB5757),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: const Icon(Icons.account_circle, size: 40, color: Colors.white),
                )
              ],
            ),
            Expanded(
              flex: 4,
              child: TabBarView(
                controller: _tabController,
                children: [LoginScreen(), SignUpScreen(onRegistered: () => _tabController.animateTo(0))],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
