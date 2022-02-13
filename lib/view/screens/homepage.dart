import 'package:arham_labs/controller/user_controller.dart';
import 'package:arham_labs/model/responses/content_home.dart';
import 'package:arham_labs/services/content_service.dart';
import 'package:arham_labs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/content_card.dart';

/// MainHomePage of the Screen when user is already logged in
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ContentHomeService contentHomeService = Get.put(ContentHomeService());
  final _userController = Get.put(UserController());

  ContentHome get _contentHome => contentHomeService.contentHome.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Content", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32)),
        actions: [
          IconButton(
            onPressed: () => _userController.logout(),
            icon: const Icon(Icons.logout, size: 30, color: Colors.black),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 15),
        child: Obx(
          () => contentHomeService.isLoading.value
              ? centeredProgressIndicator
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      commonSpace,
                      const Text("Videos", style: TextStyles.boldBodyText),
                      commonSpace,
                      if (_contentHome.videos != null) ContentView(contents: _contentHome.videos!, isVideo: true),
                      commonSpace,
                      const Text("Blogs", style: TextStyles.boldBodyText),
                      commonSpace,
                      if (_contentHome.blogs != null) ContentView(contents: _contentHome.blogs!, isVideo: false),
                      commonSpace,
                      const Text("Mini Courses", style: TextStyles.boldBodyText),
                      commonSpace,
                      if (_contentHome.miniCourses != null) ContentView(contents: _contentHome.miniCourses!, isVideo: true, isMiniCourse: true)
                    ],
                  ),
                ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        showUnselectedLabels: true,
        selectedIconTheme: const IconThemeData(color: Color(0xffDB303C), size: 30),
        unselectedIconTheme: const IconThemeData(color: Color(0xffCCCCCC)),
        selectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(color: Color(0xffCCCCCC), fontSize: 15),
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xffCCCCCC),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: "Forums"),
          BottomNavigationBarItem(icon: Icon(Icons.campaign), label: "Content"),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: "Trainer"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
    );
  }
}

class ContentView extends StatelessWidget {
  final List<Content> contents;
  final bool isVideo;
  final bool isMiniCourse;

  const ContentView({
    Key? key,
    required this.contents,
    required this.isVideo,
    this.isMiniCourse = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: contents.length,
        itemBuilder: (ctx, int index) => ContentCard(
          isVideo: isVideo,
          isMiniCourse: isMiniCourse,
          title: contents[index].title,
          imageUrlTb: contents[index].thumbnailUrl,
        ),
        separatorBuilder: (BuildContext _, int __) => const SizedBox(width: 20),
      ),
    );
  }
}
