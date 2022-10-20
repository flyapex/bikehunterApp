import 'package:bikehunter/screen/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller/db_controller.dart';
import 'screen/login/sl_home.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    final dbController = Get.put(DBController());
    return GetMaterialApp(
      title: 'Bike Hunter',
      debugShowCheckedModeBanner: false,
      // home: HomeView(),
      home: dbController.isLogin() == 0 ? const SLHome() : const HomeView(),
    );
  }
}
