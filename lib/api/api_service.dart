import 'dart:convert';
import 'package:bikehunter/model/ads_model.dart';
import 'package:bikehunter/model/location_model.dart';
import 'package:bikehunter/model/login_model.dart';
import 'package:bikehunter/model/post_model.dart';
import 'package:http/http.dart' as http;

var baseUrl = 'http://bikehunter.xyz/api';

var headers = {
  "content-type": 'application/json;charset=UTF-8',
  'Charset': 'utf-8'
};

class ApiService {
  // ignore: non_constant_identifier_names
  static Future ApiCheck() async {
    var response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      print(response.body);
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

  static Future userChacGoogle(email) async {
    var response = await http.post(
      Uri.parse('$baseUrl/email'),
      body: jsonEncode({"email": email}),
      headers: headers,
    );

    if (response.statusCode == 200 && uidmodelFromJson(response.body).isEmpty) {
      return null;
    } else {
      return uidmodelFromJson(response.body)[0].uid;
    }
  }

  static Future createNewUser(NewUserSend data) async {
    var response = await http.post(
      Uri.parse('$baseUrl/signup'),
      body: newUserSendToJson(data),
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
  }

  // loding banner ads api
  static Future bannerAds() async {
    final response = await http.get(Uri.parse("$baseUrl/bannerads"));
    if (response.statusCode == 200) {
      return bannerAdsListFromJson(response.body);
    } else {
      return null;
    }
  }

  // ------------------loading post
  static Future getallPostApi(page) async {
    var response = await http.post(
      Uri.parse('$baseUrl/allpost'),
      body: pageModelToJson(page),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return postListRecModelFromJson(response.body);
    } else {
      return null;
    }
  }

  //single post api
  static Future getSinglePostApi(pid) async {
    var response = await http.post(
      Uri.parse('$baseUrl/postid'),
      body: jsonEncode(
        {
          "pid": "$pid",
        },
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return singlePostModelFromJson(response.body);
      // return singlePostModelFromJson(response.body)[0];
    } else {
      return null;
    }
  }

  // get user details for post
  static Future getUserData(id) async {
    var response = await http.post(
      Uri.parse('$baseUrl/uid'),
      body: jsonEncode({"uid": "$id"}),
      headers: headers,
    );

    if (response.statusCode == 200 &&
        userdetailsFromJson(response.body).isEmpty) {
      return null;
    } else {
      return userdetailsFromJson(response.body)[0];
    }
  }

  // sending post data
  static Future postNow(PostmodelSend data) async {
    var response = await http.post(
      Uri.parse('$baseUrl/post'),
      body: postmodelSendToJson(data),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
