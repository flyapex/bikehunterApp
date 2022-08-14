import 'package:bikehunter/controller/themes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Obx(
      () => Scaffold(
        backgroundColor: themeController.bgColor.value,
        appBar: AppBar(
          title: const Text('Bike Hunter'),
          actions: [
            IconButton(
              icon: Icon(
                Get.isDarkMode ? FontAwesome.moon_o : FontAwesome.sun_o,
              ),
              onPressed: () {
                if (Get.isDarkMode) {
                  themeController.changeThemeMode(ThemeMode.light);
                  themeController.saveTheme(false);
                } else {
                  themeController.changeThemeMode(ThemeMode.dark);
                  themeController.saveTheme(true);
                }
                themeController.changeBackGroundColor();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.redAccent,
            ),
            Text(Get.isDarkMode.toString()),
          ],
        ),
      ),
    );
  }
}