import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DBController extends GetxController {
  final _box = GetStorage();
  // ignore: non_constant_identifier_names
  final _login_key = 'islogin';

  // bool isLogin() => _box.read(_login_key) ?? false; //check initial value

  // void saveTheme(bool login) => _box.write(_login_key, login); //Update Vlaue

//!----------------------------------------------------- uid storage -----------------------------------------------------
  // ignore: non_constant_identifier_names
  // final _uid_key = 'uid';

  int isLogin() => _box.read(_login_key) ?? 0; //mian login 41
  // int isLogin() => 41;
  saveUserId(int value) => _box.write(_login_key, value);

  String getdis() => _box.read('dis') ?? 'Dhaka';
  saveUserdis(String value) => _box.write('dis', value);

  String getcity() => _box.read('city') ?? 'Dhaka';
  saveUsercity(String value) => _box.write('city', value);
}
