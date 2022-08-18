import 'package:get/get.dart';

class NavbarController extends GetxController {
//connection checking for internet
  var connection = true.obs;
  var currentIndex = 0.obs;
  get selectedIndex => currentIndex.value;
  set selectedIndex(index) => currentIndex.value = index;
}
