import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bikehunter/controller/db_controller.dart';
import 'package:bikehunter/screen/Signup/login.dart';
import 'package:bikehunter/screen/home/home.dart';
import 'package:bikehunter/screen/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/socialicons.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DBController dbController = Get.find();
    // String passWardGenerator(int len) {
    //   var r = Random();
    //   const chars =
    //       'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    //   return List.generate(len, (index) => chars[r.nextInt(chars.length)])
    //       .join();
    // }

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  // Text(
                  //   'Bike',
                  //   style: TextStyle(
                  //     fontFamily: 'h3',
                  //     // color: Color(0xfff77f00),
                  //     color: Colors.white,
                  //     // color: Color(0xff0a020e),
                  //     fontSize: 40,
                  //     letterSpacing: 1,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // // Text(
                  // //   '|',
                  // //   style: TextStyle(
                  // //     fontFamily: 'h3',
                  // //     color: Colors.white,
                  // //     fontSize: 45,
                  // //     letterSpacing: .5,
                  // //     fontWeight: FontWeight.bold,
                  // //   ),
                  // // ),
                  // Text(
                  //   ' Hunter',
                  //   style: TextStyle(
                  //     fontFamily: 'h3',
                  //     // color: Color(0xfff77f00),
                  //     color: Color(0xfff77f00),
                  //     // color: Color(0xff0a020e),
                  //     fontSize: 40,
                  //     letterSpacing: 1,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              // color: Colors.black12,
              child: Column(
                children: [
                  const Text(
                    "Fast way to",
                    style: TextStyle(
                      fontFamily: 'h2',
                      fontSize: 32.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    child: AnimatedTextKit(
                      pause: const Duration(milliseconds: 1400),
                      repeatForever: true,
                      animatedTexts: [
                        TyperAnimatedText(
                          'find 👀',
                          speed: const Duration(milliseconds: 150),
                        ),
                        TyperAnimatedText(
                          'buy 😊',
                          speed: const Duration(milliseconds: 150),
                        ),
                        TyperAnimatedText(
                          'sell 🤑',
                          speed: const Duration(milliseconds: 150),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Text(
                  "By continuing,you aggree to our ",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        // Get.to(() => const PrivacyPage());
                      }),
                      child: const Text(
                        "User Agreement and  Privacy Policy.",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          // fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    dbController.saveUserId(41);
                    Get.offAll(
                      () => const HomeView(),
                      transition: Transition.circularReveal,
                    );
                    // final LoginResult result = await FacebookAuth.instance
                    //     .login(loginBehavior: LoginBehavior.webOnly);
                    // if (result.status == LoginStatus.success) {
                    //   FacebookAuth.i.getUserData().then(
                    //     (user) async {
                    //       var uid =
                    //           await loginController.usercheckFB(user["id"]);
                    //       if (uid == 0) {
                    //         //-----------User Not exist----------
                    //         var response = await loginController.creatNewUser(
                    //           NewUser(
                    //             fb: user["id"],
                    //             tcaller: '',
                    //             email: user["email"],
                    //             name: user["name"],
                    //             image: user["picture"]["data"]["url"],
                    //             phone: '',
                    //             pass: passWardGenerator(6),
                    //             wappnumber: '',
                    //           ),
                    //         );
                    //         db_Controller.saveUserId(response);
                    //         Get.offAll(
                    //           () => const HomeView(),
                    //           transition: Transition.circularReveal,
                    //         );
                    //       } else {
                    //         //-----------User exist----------
                    //         db_Controller.saveUserId(uid);
                    //         Get.offAll(
                    //           () => const HomeView(),
                    //           transition: Transition.circularReveal,
                    //         );
                    //       }
                    //     },
                    //   );
                    // }
                  },
                  child: const SocialIcons(
                    icon: 'assets/icons/sl/fb.svg',
                    iconsize: 30,
                    title: "Sign up with Facebook",
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    Get.offAll(
                      () => const HomePage(),
                      transition: Transition.circularReveal,
                      duration: const Duration(milliseconds: 600),
                    );
                  },
                  child: const SocialIcons(
                    icon: 'assets/icons/sl/call.svg',
                    iconsize: 30,
                    title: "Sign up with TrueCaller",
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        elevation: 6.0,
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        content: const Text(
                          "Under Development",
                          style: TextStyle(color: Colors.white),
                        ),
                        action: SnackBarAction(
                          label: 'ok',
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                  child: const SocialIcons(
                    iconsize: 32,
                    icon: 'assets/icons/sl/wapp.svg',
                    title: "Sign up with Whatsapp",
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const LogIn(),
                      transition: Transition.downToUp,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Already a account?",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'h2',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        " Log in",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'h4',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
