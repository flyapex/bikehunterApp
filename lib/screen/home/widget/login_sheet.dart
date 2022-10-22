import 'dart:math';

import 'package:bikehunter/api/google_api.dart';
import 'package:bikehunter/controller/db_controller.dart';
import 'package:bikehunter/controller/login_controller.dart';
import 'package:bikehunter/model/login_model.dart';
import 'package:bikehunter/screen/home/home_view.dart';
import 'package:bikehunter/screen/login/widget/socialiconlogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSheet extends StatelessWidget {
  const LoginSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final DBController dbController = Get.find();
    final LoginController loginController = Get.put(LoginController());
    String passWardGenerator(int len) {
      var r = Random();
      const chars =
          'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      return List.generate(len, (index) => chars[r.nextInt(chars.length)])
          .join();
    }

    return Listener(
      onPointerUp: (opu) {},
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 100),
        height: Get.height / 3.7,
        width: Get.width,
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   colors: [Colors.blue, Colors.purpleAccent],
          // ),
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 4,
              width: 40,
              margin: const EdgeInsets.only(top: 5, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text('Welcome Singup to BikeHunter'),
                ),
                InkWell(
                  onTap: () async {
                    var user = await GoogleSignInApi.login();
                    var isUser =
                        await loginController.userChackEmail(user!.email);
                    // print(isUser);

                    if (isUser == null) {
                      // //*-----------User Not exist----------
                      loginController.name.value = user.displayName!;
                      loginController.email.value = user.email;
                      loginController.image.value = user.photoUrl ?? "";
                      loginController.pass.value = passWardGenerator(6);
                      var response = await loginController.creatNewUser(
                        NewUserSend(
                          fb: '',
                          email: loginController.email.value,
                          name: loginController.name.value,
                          image: loginController.image.value,
                          pass: loginController.pass.value,
                          phone: '',
                          wappnumber: '',
                        ),
                      );
                      Get.snackbar(
                        'Congrats👏🤝',
                        '$response',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.white,
                        borderRadius: 10,
                        margin: const EdgeInsets.all(10),
                      );
                      dbController.saveUserId(response);
                      Get.offAll(
                        const HomeView(),
                        transition: Transition.circularReveal,
                        duration: const Duration(milliseconds: 600),
                      );
                      // dbController.saveUserId();
                    } else {
                      //*-----------User exist----------
                      dbController.saveUserId(isUser);
                      Get.offAll(
                        const HomeView(),
                        transition: Transition.circularReveal,
                        duration: const Duration(milliseconds: 600),
                      );
                    }
                  },
                  child: const Center(
                    child: SocialIconsLogin(
                      iconsize: 30,
                      iconColor: Colors.red,
                      icon: 'assets/icons/login/google.svg',
                      title: "Continue with Google     ",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {},
                  child: const Center(
                    child: SocialIconsLogin(
                      iconsize: 30,
                      iconColor: Colors.red,
                      icon: 'assets/icons/login/fb.svg',
                      title: "Continue with facebook",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
