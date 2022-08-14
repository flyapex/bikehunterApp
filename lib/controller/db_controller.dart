import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DBController extends GetxController {
  final _box = GetStorage();
  // ignore: non_constant_identifier_names
  final _login_key = 'islogin';

  //* LOGIN CHECK

  //check initial value
  bool isLogin() => _box.read(_login_key) ?? false;

  //Update Vlaue
  void saveTheme(bool login) => _box.write(_login_key, login);

//!-----------------------------------------------------
  // updateUserID(int value) async {
  //   var preferences = await SharedPreferences.getInstance();
  //   preferences.setInt('uid', value);
  // }
  setUserId(int value) async {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setInt('uid', value);
  }

  getUserID() async {
    // var preferences = await SharedPreferences.getInstance();
    // int? uid = preferences.getInt('uid');
    // return uid;
  }
  //* LOGIN CHECK END
}
