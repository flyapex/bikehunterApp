import 'package:bikehunter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  // Get the instance of GetStorage
  final _box = GetStorage();
  final _key = 'isDarkMode';

  // Get the theme mode from local storage
  ThemeMode get theme => loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool loadTheme() => _box.read(_key) ?? false;

  void saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);

  void changeTheme(ThemeData theme) => Get.changeTheme(theme);

  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);

  var bgColor = kPrimary.obs;
  void changeBackGroundColor() {
    if (theme == ThemeMode.dark) {
      bgColor.value = kPrimary;
    } else {
      bgColor.value = kSecondary;
    }
  }
}
