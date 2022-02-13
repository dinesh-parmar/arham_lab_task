import 'package:arham_labs/model/responses/content_detail.dart';
import 'package:arham_labs/model/responses/general_response.dart';
import 'package:arham_labs/services/api/content_api.dart';
import 'package:arham_labs/utils/base_api.dart';
import 'package:get/get.dart';

/// Service which calls the content_detail API.
class ContentDetailService extends GetxController with BaseApi {
  final contentApi = ContentApi();
  final isLoading = false.obs;
  final contentDetail = ContentDetail().obs;

  @override
  void onInit() {
    super.onInit();
    getContentDetail();
  }

  Future<GeneralResponse<ContentDetail>> getContentDetail() async {
    isLoading(true);
    final resp = await loadResponse(() => contentApi.getContentDetail());
    if (resp.success == true && resp.data != null) {
      contentDetail(resp.data!);
      isLoading(false);
    } else {
      resp.showErrorDialog();
    }
    return resp;
  }
}
