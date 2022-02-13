import 'package:arham_labs/model/responses/content_detail.dart';
import 'package:arham_labs/services/content_detail_service.dart';
import 'package:arham_labs/utils/constants.dart';
import 'package:arham_labs/view/widget/platform_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ContentDetailScreen extends StatelessWidget {
  ContentDetailScreen({Key? key}) : super(key: key);

  final contentDetailController = Get.put(ContentDetailService());

  ContentDetail get _contentDetail => contentDetailController.contentDetail.value;

  final DateFormat dateFormat1 = DateFormat('MM/dd/yyyy hh:mm'); //Formatter to get DateTime object from APIResponse
  final DateFormat dateFormat2 = DateFormat.yMMMd().add_jm(); //Formatter to format the DateTime object to Human Readable

  String get publishedTime {
    final dt = dateFormat1.parse("${_contentDetail.blogDetail!.publishDate} ${_contentDetail.blogDetail!.publishTime}");
    return dateFormat2.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Obx(
        () => contentDetailController.isLoading.value
            ? centeredProgressIndicator
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlatformCachedNetworkImage(_contentDetail.blogDetail!.media!.url!, fit: BoxFit.contain),
                  commonSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                _contentDetail.blogDetail!.title!,
                                style: TextStyles.boldBodyText,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${_contentDetail.blogDetail!.category!} • $publishedTime",
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.share,
                          size: 32,
                          color: Color(0xff999999),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SingleChildScrollView(child: Html(data: _contentDetail.blogDetail!.blogContent)),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
