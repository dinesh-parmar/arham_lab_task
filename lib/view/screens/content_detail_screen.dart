import 'package:arham_labs/model/responses/content_detail.dart';
import 'package:arham_labs/services/content_detail_service.dart';
import 'package:arham_labs/utils/constants.dart';
import 'package:arham_labs/view/widget/platform_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentDetailScreen extends StatelessWidget {
  ContentDetailScreen({Key? key}) : super(key: key);

  final contentDetailController = Get.put(ContentDetailService());

  ContentDetail get _contentDetail => contentDetailController.contentDetail.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Obx(
        () => contentDetailController.isLoading.value
            ? centeredProgressIndicator
            : Column(
                children: [
                  PlatformCachedNetworkImage(_contentDetail.blogDetail!.media!.url!, fit: BoxFit.contain),
                ],
              ),
      ),
    );
  }
}
