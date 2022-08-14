import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bikehunter/screen/Signup/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'widget/socialicons.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String passWardGenerator(int len) {
    //   var r = Random();
    //   const _chars =
    //       'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    //   return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
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
                    final LoginResult result = await FacebookAuth.instance
                        .login(loginBehavior: LoginBehavior.webOnly);
                    if (result.status == LoginStatus.success) {
                      FacebookAuth.i.getUserData().then(
                        (user) async {
                          print(user['name']);
                          print(user['email']);
                          print(user['id']);
                          print(user['picture']['data']['url']);
                          // var uid = await loginController
                          //     .userChackFacebook(user["id"]);

                          // if (uid == null) {
                          //   //*-----------User Not exist----------
                          //   print("User done't exist");
                          // } else {
                          //   //*-----------User exist----------
                          //   Get.offAll(() => const HomeView());
                          //   databaseController.setUserId(uid);
                          //   databaseController.loginUpdate(true);
                          // }
                        },
                      );
                    }
                  },
                  child: const SocialIcons(
                    icon: 'assets/icons/sl/fb.svg',
                    iconsize: 30,
                    title: "Sign up with Facebook",
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {},
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
                    Get.to(() => const LogIn());
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
