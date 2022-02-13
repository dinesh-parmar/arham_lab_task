import 'package:arham_labs/utils/extensions.dart';
import 'package:arham_labs/utils/routes.dart';
import 'package:arham_labs/view/widget/platform_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentCard extends StatelessWidget {
  final bool isVideo;
  final String? title;
  final String? imageUrlTb;
  final bool isMiniCourse;

  const ContentCard({Key? key, required this.isVideo, required this.title, required this.imageUrlTb, required this.isMiniCourse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.contentPage),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black87, Colors.black12],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Ink(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: imageUrlTb != null ? DecorationImage(image: NetworkImage(imageUrlTb!), fit: BoxFit.cover) : null,
                borderRadius: BorderRadius.circular(10),
              ),
              child: isVideo ? const Icon(Icons.play_circle_outline, color: Colors.white, size: 45) : const SizedBox(),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: Visibility(
                visible: isMiniCourse,
                child: const Icon(
                  Icons.monetization_on,
                  color: Color(0xffFECE00),
                  size: 30,
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title?.capitalizeFirstLetter() ?? "",
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Text("0:24", style: TextStyle(color: Colors.white, fontSize: 18))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
