import 'package:bikehunter/api/api_service.dart';
import 'package:bikehunter/model/bike_model.dart';
import 'package:bikehunter/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'location_controller.dart';

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

//------------------------------------------------------------Fetching Post List
  late ScrollController scrollController = ScrollController();

  var page = 1.obs;
  var allpostLoding = true.obs;
  var allpostList = [].obs;

  getAllPost() async {
    try {
      allpostLoding(true);
      var response = await ApiService.getallPostApi(
          PageModel(page: page.value.toString()));
      if (response != null) {
        allpostList.addAll(response);
        if (response.isEmpty) {
          allpostLoding(false);
        }
        page = page + 1;
      }
    } finally {}
  }

  var pagepostlistLoding = true.obs;
  var pagepostlist = [].obs;
  getSinglePost(pid) async {
    try {
      pagepostlistLoding(true);
      var response = await ApiService.getSinglePostApi(pid);
      if (response != null) {
        pagepostlist.addAll(response);
      }
    } finally {
      pagepostlistLoding(false);
    }
  }
//*---------------------------------------POSTNOW --------------------

  //* bottom sheet hight for new post
  var bottomSheetSize = 0.0.obs;
  var pageController = PageController();
  // var currentPage = 0.obs;
  var cappedCatagoryInxed = 10.obs;
  //!------------------------------------------------------------Post Work------------------------------------------------------!//
  //* post controller

  // main page cahck
  var page1 = false.obs;
  var page2 = false.obs;
  var page3 = false.obs;

  //* page 2
  TextEditingController title = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController kmdriven = TextEditingController();
  TextEditingController price = TextEditingController();
  var conditiontxt = 'Used'.obs;
  TextEditingController description = TextEditingController();
  late String image1 = '';
  late String image2 = '';
  late String image3 = '';
  late String image4 = '';
  late String image5 = '';

  var companytxt = 'Select Catagory'.obs;
  var moideltxt = 'Select Catagory'.obs;

  List<String> moidellist = bajaj.obs;
  // List<String> moidellists = bajajs.obs;

  void modelChack(int type) {
    if (type == 0) {
      if (companytxt.value == 'Bajaj') {
        moideltxt.value = bajaj[0];
        moidellist = bajaj;
      } else if (companytxt.value == "Hero") {
        moideltxt.value = hero[0];
        moidellist = hero;
      } else if (companytxt.value == 'Hero Honda') {
        moideltxt.value = heroHonda[0];
        moidellist = heroHonda;
      } else if (companytxt.value == 'Honda') {
        moideltxt.value = honda[0];
        moidellist = honda;
      } else if (companytxt.value == 'KTM') {
        moideltxt.value = ktm[0];
        moidellist = ktm;
      } else if (companytxt.value == 'Suzuki') {
        moideltxt.value = suzuki[0];
        moidellist = suzuki;
      } else if (companytxt.value == 'TVS') {
        moideltxt.value = tVS[0];
        moidellist = tVS;
      } else if (companytxt.value == 'Yamaha') {
        moideltxt.value = yamaha[0];
        moidellist = yamaha;
      } else if (companytxt.value == 'Other Brands') {
        moideltxt.value = otherBrands[0];
        moidellist = otherBrands;
      }
    } else if (type == 1) {
      if (companytxt.value == 'Bajaj') {
        moideltxt.value = bajajs[0];
        moidellist = bajajs;
      } else if (companytxt.value == "Hero") {
        moideltxt.value = heros[0];
        moidellist = heros;
      } else if (companytxt.value == 'Honda') {
        moideltxt.value = hondas[0];
        moidellist = hondas;
      } else if (companytxt.value == 'Mahindra') {
        moideltxt.value = mahindras[0];
        moidellist = mahindras;
      } else if (companytxt.value == 'Suzuki') {
        moideltxt.value = suzukis[0];
        moidellist = suzukis;
      } else if (companytxt.value == 'TVS') {
        moideltxt.value = tVSs[0];
        moidellist = tVSs;
      } else if (companytxt.value == 'Other Brands') {
        moideltxt.value = otherBrandss[0];
        moidellist = otherBrandss;
      }
    }
  }

  page2chack() {
    if (companytxt.value != 'Select Catagory' &&
        title.text != '' &&
        year.text != '' &&
        kmdriven.text != '' &&
        price.text != '' &&
        description.text != '' &&
        (image1 != '' ||
            image2 != '' ||
            image3 != '' ||
            image4 != '' ||
            image5 != '')) {
      page2.value = true;
    } else {
      page2.value = false;
    }
  }

  // api call

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var whatsappController = TextEditingController();

  RxInt uid = 0.obs;
  RxString fb = ''.obs;
  RxString tcaller = ''.obs;
  RxString email = ''.obs;
  RxString name = ''.obs;
  RxString image = ''.obs;
  RxString pass = ''.obs;
  RxString phone = ''.obs;
  RxString wappnumber = ''.obs;
  // RxString location = ''.obs;
  RxString ip = ''.obs;
  late DateTime time = ''.obs as DateTime;

  var isLoading = false.obs;
  userChackByID(id) async {
    try {
      isLoading(true);
      var user = await ApiService.getUserData(id);
      if (user == null) {
        return null;
      } else {
        uid.value = user.uid;
        fb.value = user.fb;
        tcaller.value = user.tcaller;
        email.value = user.email;
        name.value = user.name;
        image.value = user.image;
        phone.value = user.phone;
        wappnumber.value = user.wappnumber;
        ip.value = user.ip;
        // location.value = user.location;
        return user;
      }
    } finally {
      isLoading(false);
    }
  }

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

//*---------------------------------- posting now
  postApi(uid) async {
    LocationController locationController = Get.find();
    if (page1.value == true && page2.value == true) {
      try {
        var responsetxt = await ApiService.postNow(PostmodelSend(
          userId: uid,
          category: cappedCatagoryInxed.value,
          brand: companytxt.value,
          model: moideltxt.value,
          title: title.text,
          year: int.parse(year.text),
          kmDriven: int.parse(kmdriven.text),
          price: price.text,
          bikeCondition: conditiontxt.value,
          description: description.text,
          image1: image1,
          image2: image2,
          image3: image3,
          image4: image4,
          image5: image5,
          city: locationController.subdivitiontxt.value,
        ));
        if (responsetxt == null) {
          return null;
        } else {
          return responsetxt;
        }
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    } else {
      Get.snackbar(
        'Hey did you forget something?🤔',
        'Please fill all the field',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
        snackStyle: SnackStyle.FLOATING,
        duration: const Duration(seconds: 2),
      );
    }
  }
}
