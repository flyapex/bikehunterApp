import 'package:bikehunter/api/api_service.dart';
import 'package:bikehunter/model/catagory_model.dart';
import 'package:bikehunter/model/location_model.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var lodinglocation = true.obs;
  getLocation(uid) async {
    try {
      lodinglocation(true);
      var response = await ApiService.getlocation(uid);
      if (response != null) {
        alldivitiontxt.value = response.division;
        subdivitiontxt.value = response.city;
      }
    } finally {
      lodinglocation(false);
    }
  }

  setLocation(LocationUpdateModel data) async {
    try {
      lodinglocation(true);
      var response = await ApiService.setLocaation(data);
      if (response != null) {
        // alldivitiontxt.value = response.division;
        // subdivitiontxt.value = response.city;
        // ignore: avoid_print
        print(response);
      } else {
        print("Error");
      }
    } finally {}
  }

  var alldivitiontxt = 'Select Catagory'.obs;
  var subdivitiontxt = 'Select Catagory'.obs;

  List<String> subdivitionlist = dhaka.obs;

  void catagoryChack() {
    if (alldivitiontxt.value == 'Dhaka') {
      subdivitiontxt.value = dhaka[0];
      subdivitionlist = dhaka;
    } else if (alldivitiontxt.value == "Khulna") {
      subdivitiontxt.value = khulna[0];
      subdivitionlist = khulna;
    } else if (alldivitiontxt.value == 'Chittagong') {
      subdivitiontxt.value = chittagong[0];
      subdivitionlist = chittagong;
    } else if (alldivitiontxt.value == 'Barisal') {
      subdivitiontxt.value = barisal[0];
      subdivitionlist = barisal;
    } else if (alldivitiontxt.value == 'Rajshahi') {
      subdivitiontxt.value = rajshahi[0];
      subdivitionlist = rajshahi;
    } else if (alldivitiontxt.value == 'Rangpur') {
      subdivitiontxt.value = rangpur[0];
      subdivitionlist = rangpur;
    } else if (alldivitiontxt.value == 'Sylhet') {
      subdivitiontxt.value = sylhet[0];
      subdivitionlist = sylhet;
    } else if (alldivitiontxt.value == 'Mymensingh') {
      subdivitiontxt.value = mymensingh[0];
      subdivitionlist = mymensingh;
    }
  }
}
