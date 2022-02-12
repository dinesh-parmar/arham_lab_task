import 'package:arham_labs/model/responses/content_home.dart';
import 'package:arham_labs/model/responses/general_response.dart';
import 'package:arham_labs/services/api/content_api.dart';
import 'package:arham_labs/utils/base_api.dart';
import 'package:get/get.dart';

class ContentHomeService extends GetxController with BaseApi {
  final contentApi = ContentApi();
  final isLoading = false.obs;
  final contentHome = ContentHome().obs;

  Future<GeneralResponse<ContentHome>> getContentHomeData() async {
    isLoading(true);
    final resp = await loadResponse(() => contentApi.getContentHomeData());
    if (resp.success == true && resp.data != null) {
      contentHome(resp.data);
      isLoading(false);
    } else {
      resp.showErrorDialog();
    }
    return resp;
  }

  @override
  void onInit() async {
    super.onInit();
    getContentHomeData();
  }
}
