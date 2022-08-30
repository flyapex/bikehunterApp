import 'package:bikehunter/controller/db_controller.dart';
import 'package:bikehunter/controller/post_controller.dart';
import 'package:bikehunter/screen/home/widget/location_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import 'widget/components.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  PostController postController = Get.find();
  DBController databaseController = Get.put(DBController());
  // postController postController = Get.find();

  getUserUid() async {
    await postController.userChackByID(databaseController.isLogin());
  }

  @override
  void initState() {
    getUserUid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () async {
          //*Update Profile
          // var res = await postController
          //     .updatePorfile(await databaseController.getUserID());
          var message =
              await postController.postApi(databaseController.isLogin());

          if (message != null) {
            Get.snackbar(
              '$message',
              'Have A Nice Day🏅✨',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.greenAccent,
              colorText: Colors.white,
              borderRadius: 10,
              margin: const EdgeInsets.all(10),
              snackStyle: SnackStyle.FLOATING,
              duration: const Duration(seconds: 2),
            );
            Navigator.pop(context);
          }
        },
        icon: const Icon(Feather.check),
        label: const Text(" Post Now  "),
        backgroundColor: Colors.black,
      ),
      body: Obx(
        (() {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Review Your Details',
                    style: TextStyle(fontSize: 24, letterSpacing: 1),
                  ),
                  Text(
                    'Please chose your location',
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1,
                        color: Colors.black.withOpacity(0.3)),
                  ),
                  const SizedBox(height: 10),
                  const CatagoryBox(
                    title: "District *",
                    title2: "City *",
                    topPadding: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, right: 20),
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: postController.image.value == ''
                            ? Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.1),
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/post/profile.svg',
                                    height: 42,
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Stack(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF6F7FC),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            postController.image.value,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Feather.camera,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      Expanded(
                        child: FullTextInputBoxTemp(
                          topPadding: 10,
                          bottomPadding: 6,
                          title: "Name",
                          textType: TextInputType.text,
                          hintText: postController.name.value,
                          controller: postController.nameController,
                          icon: 'assets/icons/post/text.svg',
                          iconh: 21,
                          iconw: 21,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Give Some Details to connect with others",
                    style: TextStyle(
                        //! color: TextColors.taitletextColor,
                        ),
                  ),
                  postController.fb.value == ''
                      ? Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Facebook",
                                //! style:
                                //     TextStyle(color: TextColors.hinttextColor),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      tooltip: 'Add Image',
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/icons/post/messenger.svg',
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    Expanded(
                                      child: Card(
                                        // color: Colors.black,
                                        color: const Color(0xff4A4F6C),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          splashColor:
                                              Colors.white.withOpacity(0.7),
                                          onTap: () async {},
                                          child: Ink(
                                            height: 44,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                  Feather.plus,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 7),
                                                Text(
                                                  'Add Facebook',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing: 0.5,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : InkWell(
                          onTap: () {},
                          child: FaceBookBox(
                            topPadding: 15,
                            bottomPadding: 6,
                            title: "Facebook",
                            hintextprefix: ' profile : ',
                            textType: TextInputType.number,
                            hintText: postController.fb.value,
                            controller: postController.title,
                            icon: 'assets/icons/post/fbg.svg',
                            iconh: 21,
                            iconw: 21,
                            color: Colors.blueAccent,
                          ),
                        ),
                  NumberBox(
                    topPadding: 10,
                    bottomPadding: 6,
                    title: "WhatsApp",
                    textType: TextInputType.number,
                    hintText: postController.wappnumber.value,
                    controller: postController.whatsappController,
                    icon: 'assets/icons/post/wapp.svg',
                    iconh: 22,
                    iconw: 22,
                    color: Colors.lightGreen,
                  ),
                  NumberBox(
                    topPadding: 10,
                    bottomPadding: 6,
                    title: "Phone",
                    textType: TextInputType.number,
                    hintText: postController.phone.value,
                    controller: postController.phoneController,
                    icon: 'assets/icons/post/call.svg',
                    iconh: 21,
                    iconw: 21,
                    color: const Color(0xff6E7FFC),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class FaceBookBox extends StatefulWidget {
  final String title;
  final String icon;
  final Color color;
  final String hintText;
  final String hintextprefix;
  final TextInputType textType;
  final double topPadding;
  final double bottomPadding;
  final TextEditingController controller;
  final double iconh;
  final double iconw;
  const FaceBookBox({
    required this.title,
    required this.icon,
    required this.textType,
    required this.hintText,
    this.topPadding = 10,
    required this.controller,
    required this.iconh,
    required this.iconw,
    Key? key,
    this.bottomPadding = 15,
    required this.color,
    required this.hintextprefix,
  }) : super(key: key);

  @override
  _FaceBookBoxState createState() => _FaceBookBoxState();
}

class _FaceBookBoxState extends State<FaceBookBox> {
  var iconColorChange = false;
  var textstyle = const TextStyle(
    overflow: TextOverflow.fade,
    //! color: TextColors.maintextColor,
    height: 1.2,
    fontSize: 16,
    letterSpacing: 1.2,
  );
  var textstyleh = const TextStyle(
    overflow: TextOverflow.fade,
    height: 1.2,
    //! color: TextColors.hinttextColor,
    fontSize: 15,
    letterSpacing: 1.2,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: widget.topPadding),
        Text(
          widget.title,
          style: const TextStyle(
            //! color: TextColors.taitletextColor,
            letterSpacing: 0.7,
          ),
        ),
        SizedBox(height: widget.bottomPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 48,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffF2F3F5),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.hintextprefix,
                      style: textstyleh,
                    ),
                    Text(
                      widget.hintText,
                      style: textstyle,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {},
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(6),
                  // border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    widget.icon,
                    height: widget.iconh,
                    width: widget.iconw,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class NumberBox extends StatefulWidget {
  final String title;
  final String icon;
  final Color color;
  final String hintText;
  final TextInputType textType;
  final double topPadding;
  final double bottomPadding;
  final TextEditingController controller;
  final double iconh;
  final double iconw;
  const NumberBox({
    required this.title,
    required this.icon,
    required this.textType,
    required this.hintText,
    this.topPadding = 10,
    required this.controller,
    required this.iconh,
    required this.iconw,
    this.bottomPadding = 15,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<NumberBox> createState() => _NumberBoxState();
}

class _NumberBoxState extends State<NumberBox> {
  var hinttex = '017xxxxxxxx';
  var iconColorChange = false;
  var textstyle = const TextStyle(
    overflow: TextOverflow.fade,
    //! color: TextColors.maintextColor,
    height: 1.2,
    fontSize: 16,
    letterSpacing: 1.2,
  );
  var textstyleh = const TextStyle(
    overflow: TextOverflow.fade,
    height: 1.2,
    //! color: TextColors.hinttextColor,
    fontSize: 15,
    letterSpacing: 1.2,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: widget.topPadding),
        Text(
          widget.title,
          style: const TextStyle(
            //! color: TextColors.taitletextColor,
            letterSpacing: 0.7,
          ),
        ),
        SizedBox(height: widget.bottomPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 48,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffF2F3F5),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.white),
                ),
                child: Stack(
                  children: [
                    widget.hintText == ''
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                hinttex,
                                style: textstyleh,
                              ),
                            ),
                          )
                        : Container(),
                    Focus(
                      onFocusChange: (v) {
                        widget.hintText == ''
                            ? setState(() {
                                hinttex = '';
                              })
                            : Container();
                      },
                      child: TextField(
                        autofillHints: const [
                          AutofillHints.telephoneNumber,
                        ],
                        cursorHeight: 22,
                        cursorWidth: 1.8,
                        cursorRadius: const Radius.circular(10),
                        controller: widget.controller,
                        textInputAction: TextInputAction.next,
                        keyboardType: widget.textType,
                        maxLines: 1,
                        cursorColor: Colors.black,
                        style: textstyle,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          isDense: true,
                          hintText: widget.hintText,
                          hintStyle: textstyleh,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // ignore: avoid_print
                print('wapp');
              },
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(6),
                  // border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    widget.icon,
                    height: widget.iconh,
                    width: widget.iconw,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
