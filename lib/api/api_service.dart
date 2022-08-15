import 'package:bikehunter/model/login_model.dart';
import 'package:dio/dio.dart';

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
    try {
      var response = await dio.post(
        '$baseUrl/fblogin',
        data: {"fb": fb},
        options: Options(headers: headers),
      );

      // print(response.data);
      // print(response.data[0]['uid']);
      // print(response.data[0]['uid'].runtimeType);
      if (response.statusCode == 200 && !response.data.isEmpty) {
        // print(response.data[0]['uid']);
        return response.data[0]['uid'];
      } else {
        // print("Error");
        return 0;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future createNewUser(data) async {
    try {
      var response = await dio.post(
        '$baseUrl/signup',
        data: data,
        options: Options(headers: headers),
      );
      return response.data['insertId'];
    } catch (e) {
      print(e);
    }
  }
}
