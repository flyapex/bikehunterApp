import 'dart:math';
import 'package:bikehunter/api/google_api.dart';
import 'package:bikehunter/controller/db_controller.dart';
import 'package:bikehunter/controller/login_controller.dart';
import 'package:bikehunter/model/login_model.dart';
import 'package:bikehunter/screen/home/home_view.dart';
import 'package:bikehunter/screen/login/sl_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'widget/socialiconlogin.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var emailLabelText = "Phone";
  var emailHintText = "";
  var passLabelText = "Password";
  var passHintText = "";
  var flote = false;

  final LoginController loginController = Get.put(LoginController());
  final DBController dbController = Get.find();
  String passWardGenerator(int len) {
    var r = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 27,
          splashColor: Colors.white,
          icon: const Icon(
            Feather.arrow_left,
            color: Color(0xff1F1F47),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Bike Hunter',
          style: TextStyle(
            fontFamily: 'h3',
            color: Color(0xff1F1F47),
            fontWeight: FontWeight.w400,
            fontSize: 25,
            letterSpacing: 1,
            height: 1.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: Text(
                  "Log in to Olx",
                  style: TextStyle(
                    fontFamily: 'h3',
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    letterSpacing: 0.3,
                    // textBaseline: TextBaseline.alphabetic,

                    // fontSize: 20,
                    // letterSpacing: 0.3,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                "By continuing, you agree to our Terms of Service and Privacy Policy",
                style: TextStyle(
                  fontFamily: 'h3',
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 12,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 20),
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
                    title: "Continue with TrueCaller",
                  ),
                ),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () async {
                  final LoginResult result = await FacebookAuth.instance
                      .login(loginBehavior: LoginBehavior.webOnly);
                  if (result.status == LoginStatus.success) {
                    FacebookAuth.i.getUserData().then(
                      (user) async {
                        var uid = await loginController.usercheckFB(user["id"]);
                        if (uid == null) {
                          //-----------User Not exist----------
                          var response = await loginController.creatNewUser(
                            NewUserSend(
                              fb: user["id"],
                              email: user["email"],
                              name: user["name"],
                              image: user["picture"]["data"]["url"],
                              phone: '',
                              pass: passWardGenerator(6),
                              wappnumber: '',
                            ),
                          );
                          // if (response == null) {
                          //   Get.snackbar(
                          //     'Sorry ',
                          //     'User Can\'t Create',
                          //     snackPosition: SnackPosition.BOTTOM,
                          //     backgroundColor: Colors.white,
                          //     borderRadius: 10,
                          //     margin: const EdgeInsets.all(10),
                          //   );
                          // } else {
                          //   dbController.saveUserId(response);
                          //   Get.offAll(() => const HomePage());
                          // }
                          dbController.saveUserId(response);
                          Get.offAll(
                            () => const HomeView(),
                            transition: Transition.circularReveal,
                          );
                        } else {
                          //-----------User exist----------
                          dbController.saveUserId(uid);
                          Get.offAll(() => const HomeView());
                        }
                      },
                    );
                  }
                },
                child: const Center(
                  child: SocialIconsLogin(
                    iconsize: 32,
                    iconColor: Colors.red,
                    icon: 'assets/icons/login/fb.svg',
                    title: "Continue with Facebook",
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 0.5,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        fontFamily: 'h3',
                        color: Colors.black.withOpacity(0.65),
                        fontSize: 12,
                        letterSpacing: 0.2,
                        height: 2,
                        // fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 0.5,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
              Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus && emailHintText == '') {
                    setState(() {
                      flote = true;
                    });
                    emailLabelText = "Phone";
                    emailHintText = "017xxxxxxxx";
                  } else {
                    setState(() {});
                    // emailHintText = 'Email';
                    emailLabelText = "Email";
                  }
                },
                child: TextFormField(
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: false,
                  cursorColor: const Color(0xFF4E2E9E),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                    height: 1.3,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.80),
                  ),
                  decoration: InputDecoration(
                    hintText: emailHintText,
                    labelText: emailLabelText,
                    contentPadding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
                    labelStyle: TextStyle(
                      height: 0,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black.withOpacity(0.65),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus && passHintText == '') {
                    setState(() {});
                    passLabelText = "Password";
                    passHintText = "•••••";
                  } else {
                    setState(() {});
                    // emailHintText = 'Email';
                    passLabelText = "Password ";
                  }
                },
                child: TextFormField(
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                  cursorColor: const Color(0xFF4E2E9E),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                    height: 1.3,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.80),
                  ),
                  decoration: InputDecoration(
                    hintText: passHintText,
                    labelText: passLabelText,
                    contentPadding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
                    labelStyle: TextStyle(
                      height: 0,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black.withOpacity(0.65),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "New to Olx?",
                    style: TextStyle(
                      fontFamily: 'h3',
                      color: Colors.black.withOpacity(0.3),
                      fontSize: 12,
                      letterSpacing: 0.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Get.offAll(() => const SLHome());
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: 'h3',
                        color: Color(0xFF452D83),
                        fontSize: 12,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  elevation: 6.0,
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  content: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  action: SnackBarAction(
                    label: 'ok',
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
              );
            },
            child: Ink(
              height: 45,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [
                    0.4,
                    0.9,
                  ],
                  colors: [
                    Color(0xff00ff87),
                    Color(0xff60efff),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                  child: Text(
                "Continue",
                style: TextStyle(
                  fontFamily: 'h2',
                  color: Color(0xff1F1F47),
                  fontSize: 25,
                  letterSpacing: 0.5,
                  height: 1.5,
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
