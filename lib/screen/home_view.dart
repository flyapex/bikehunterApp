import 'package:bikehunter/constants/colors.dart';
import 'package:bikehunter/controller/navigation_controller.dart';
import 'package:bikehunter/controller/themes_controller.dart';
import 'package:bikehunter/screen/home/home.dart';
import 'package:bikehunter/screen/post_now/new_post.dart';
import 'package:bikehunter/screen/saved/widget/saved.dart';
import 'package:bikehunter/screen/store/store.dart';
import 'package:bikehunter/screen/used/used.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final NavbarController navbarController = Get.put(NavbarController());
  // final NavbarController navbarController = Get.find();
  final ThemeController themeController = Get.find();
  // final DBController db_Controller = Get.find();

  var index = 0;
  final List<Widget> pageList = [
    const HomePage(),
    const UsedPage(),
    const StorePage(),
    const FaouritePage(),
  ];

  @override
  void initState() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        navbarController.connection.value = true;
      } else {
        navbarController.connection.value = false;
      }
    });
    super.initState();
  }

  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // key: _scaffoldKey,
        // endDrawer: const Drawer(),
        backgroundColor: kbg1,
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Center(
            child: pageList.elementAt(navbarController.selectedIndex),
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            navbarController.selectedIndex = index;
          },
          child: SafeArea(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: (navbarController.connection.value ? 62.0 : 82.0),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: kTEXT2,
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 62,
                    width: Get.width,
                    child: Material(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 20,
                            child: InkResponse(
                              onTap: () {
                                navbarController.selectedIndex = 0;
                              },
                              splashFactory: InkRipple.splashFactory,
                              radius: 30,
                              splashColor: ksplash,
                              highlightColor: Colors.transparent,
                              child: Container(
                                height: double.infinity,
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 23,
                                  width: 23,
                                  child: navbarController.selectedIndex == 0
                                      ? SvgPicture.asset(
                                          'assets/icons/home/homef.svg',
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/home/home.svg',
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 20,
                            child: InkResponse(
                              onTap: () {
                                navbarController.selectedIndex = 1;
                              },
                              splashFactory: InkRipple.splashFactory,
                              radius: 30,
                              splashColor: ksplash,
                              highlightColor: Colors.transparent,
                              child: Container(
                                height: double.infinity,
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 43,
                                  width: 43,
                                  child: navbarController.selectedIndex == 1
                                      ? SvgPicture.asset(
                                          'assets/icons/home/bike.svg',
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/home/bikef.svg',
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 20,
                            child: InkResponse(
                              onTap: () {
                                Get.bottomSheet(
                                  const NewPostPage(),
                                  elevation: 20.0,
                                  enableDrag: true,
                                  backgroundColor: Colors.white,
                                  isScrollControlled: true,
                                  ignoreSafeArea: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  enterBottomSheetDuration:
                                      const Duration(milliseconds: 170),
                                );
                              },
                              splashFactory: InkRipple.splashFactory,
                              radius: 30,
                              splashColor: ksplash,
                              highlightColor: Colors.transparent,
                              child: Container(
                                height: double.infinity,
                                alignment: Alignment.center,
                                child: Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1.2,
                                      color: kbtn1,
                                    ),
                                  ),
                                  child: const Icon(
                                    Feather.plus,
                                    size: 24.0,
                                    color: kbtn1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 20,
                            child: InkResponse(
                              onTap: () {
                                navbarController.selectedIndex = 2;
                              },
                              splashFactory: InkRipple.splashFactory,
                              radius: 30,
                              splashColor: ksplash,
                              highlightColor: Colors.transparent,
                              child: Container(
                                height: double.infinity,
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 26,
                                  width: 26,
                                  child: navbarController.selectedIndex == 2
                                      ? SvgPicture.asset(
                                          'assets/icons/home/storef.svg',
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/home/store.svg',
                                          color: const Color(0xff374957),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 20,
                            child: InkResponse(
                              onTap: () {
                                navbarController.selectedIndex = 3;
                              },
                              splashFactory: InkRipple.splashFactory,
                              radius: 30,
                              splashColor: ksplash,
                              highlightColor: Colors.transparent,
                              child: Container(
                                height: double.infinity,
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 26,
                                  width: 26,
                                  child: navbarController.selectedIndex == 3
                                      ? SvgPicture.asset(
                                          'assets/icons/home/userf.svg',
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/home/user.svg',
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  navbarController.connection.value
                      ? Container()
                      : Container(
                          height: 20,
                          color: kTEXT5,
                          child: const Center(
                            child: Text(
                              'Info not synced. Turn on internet refresh',
                              style: TextStyle(
                                color: kTEXT4,
                                letterSpacing: 0.7,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
