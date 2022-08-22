import 'package:bikehunter/api/api_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
//*---------------------------------- Loding Banner ads
  var banneradsList = [].obs;
  var bannerLoding = true.obs;
  var fatchOneTime = true.obs;
  Future bannerAdsApi() async {
    try {
      bannerLoding(true);
      var response = await ApiService.bannerAds();
      if (response != null) {
        banneradsList.addAll(response);
        // banneradsList.add(response);
        bannerLoding(false);
      }
    } finally {
      fatchOneTime(false);
    }
  }
}
