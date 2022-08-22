import 'dart:convert';
import 'package:bikehunter/model/ads_model.dart';
import 'package:bikehunter/model/location_model.dart';
import 'package:bikehunter/model/login_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

var baseUrl = 'http://bikehunter.xyz/api';
var dio = Dio();

var headers = {
  "content-type": 'application/json;charset=UTF-8',
  'Charset': 'utf-8'
};

class ApiService {
  // ignore: non_constant_identifier_names
  static Future ApiCheck() async {
    var response = await dio.get(baseUrl);

    if (response.statusCode == 200) {
      print(response.data);
    } else {
      print("object");
    }
  }

//*check is user avaliable in db
  static Future usercheckFB(fb) async {
    var response = await http.post(
      Uri.parse('$baseUrl/fblogin'),
      body: jsonEncode({"fb": fb}),
      headers: headers,
    );

    if (response.statusCode == 200 && uidmodelFromJson(response.body).isEmpty) {
      return null;
    } else {
      return uidmodelFromJson(response.body)[0].uid;
    }
  }

  static Future createNewUser(data) async {
    // try {
    //   var response = await dio.post(
    //     '$baseUrl/signup',
    //     data: data,
    //     options: Options(headers: headers),
    //   );
    //   return response.data['insertId'];
    // } catch (e) {
    //   print(e);
    // }
    var response = await http.post(
      Uri.parse('$baseUrl/signup'),
      body: newUserToJson(data),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return nweuserResFromJson(response.body).insertId;
    } else {
      return null;
    }
  }

  // get current cloation
  static Future getlocation(uid) async {
    var response = await http.post(
      Uri.parse('$baseUrl/getlocation'),
      body: jsonEncode({"uid": uid}),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return locationModelFromJson(response.body)[0];
    } else {
      return null;
    }
    // var response = await dio.post(
    //   '$baseUrl/getlocation',
    //   data: {"uid": uid},
    //   options: Options(headers: headers),
    // );

    // if (response.statusCode == 200) {
    //   return LocationModel.fromJson(response.data[0]);
    // } else {
    //   return null;
    // }
  }

  // update current location
  static Future setLocaation(data) async {
    var response = await http.post(
      Uri.parse('$baseUrl/setlocation'),
      body: locationUpdateModelToJson(data),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return null;
    } else {
      return response.body;
    }
    // var response = await dio.post(
    //   '$baseUrl/setlocation',
    //   data: data,
    //   options: Options(headers: headers),
    // );
    // if (response.statusCode == 200) {
    //   return response.data;
    // } else {
    //   return null;
    // }
  }

  // loding banner ads api
  static Future bannerAds() async {
    final response = await http.get(Uri.parse("$baseUrl/bannerads"));
    if (response.statusCode == 200) {
      return bannerAdsListFromJson(response.body);
    } else {
      return null;
    }
    // var response = await dio.get("$baseUrl/bannerads");
    // if (response.statusCode == 200) {
    //   // print(response.data);
    //   // return bannerAdsListFromJson(response.data);
    //   // return BannerAdsList.fromJson(response.data);
    // } else {
    //   return null;
    // }
  }

  // ------------------loading post
  // static Future getallPostApi(page) async {
  //   var response = await http.post(
  //     Uri.parse('$baseUrl/allpost'),
  //     body: jsonEncode(
  //       {
  //         "page": "$page",
  //       },
  //     ),
  //     headers: headers,
  //   );
  //   if (response.statusCode == 200) {
  //     return allPostRecFromJson(response.body);
  //   } else {
  //     return null;
  //   }
  // }
}
