import 'package:bikehunter/api/api_service.dart';
import 'package:bikehunter/model/login_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  usercheckFB(fb) async {
    try {
      isLoading(true);
      var user = await ApiService.usercheckFB(fb);
      if (user == null) {
        return null;
      } else {
        return user;
      }
    } finally {
      isLoading(false);
    }
  }

  //----------------- New User -----------------//

  creatNewUser(NewUser data) async {
    try {
      isLoading(true);
      var response = await ApiService.createNewUser(data);
      if (response != null) {
        print(response);
        return response;
      } else {
        return null;
      }
    } finally {
      isLoading(false);
    }
  }

  RxInt uid = 0.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString image = ''.obs;
  RxString pass = ''.obs;
  RxString fb = ''.obs;
  RxString phone = ''.obs;
  RxString wanumber = ''.obs;
  // RxString location = ''.obs;
  RxString ip = ''.obs;
  late DateTime time = ''.obs as DateTime;

  userChackEmail(email) async {
    try {
      isLoading(true);
      var user = await ApiService.userChacGoogle(email);
      if (user == null) {
        return null;
      } else {
        return user;
      }
    } finally {
      isLoading(false);
    }
  }

  // userChackByID(id) async {
  //   try {
  //     isLoading(true);
  //     var user = await ApiService.getUserData(id);
  //     if (user == null) {
  //       return null;
  //     } else {
  //       uid.value = user.uid;
  //       name.value = user.name;
  //       image.value = user.image;
  //       fb.value = user.fb;
  //       phone.value = user.phone;
  //       wanumber.value = user.wanumber;
  //       // location.value = user.location;
  //       return user;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  // fbUpdate(uid, fb) async {
  //   try {
  //     isLoading(true);
  //     var responsetxt = await ApiService.updateFbUrl(uid, fb);
  //     if (responsetxt == null) {
  //       return null;
  //     } else {
  //       return responsetxt;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  // var banneradsList = [].obs;
  // var bannerLoding = true.obs;
  // var fatchOneTime = true.obs;
  // Future bannerAdsApi() async {
  //   try {
  //     bannerLoding(true);
  //     var response = await ApiService.bannerAds();
  //     if (response != null) {
  //       banneradsList.addAll(response);
  //       bannerLoding(false);
  //     }
  //   } finally {
  //     fatchOneTime(false);
  //   }
  // }
}
