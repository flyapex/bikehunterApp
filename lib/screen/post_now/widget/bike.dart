import 'package:bikehunter/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import 'components.dart';
import 'image.dart';

class PageForBike extends StatelessWidget {
  const PageForBike({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostController postController = Get.find();
    double toppadding = 0.0;
    double space = 20.0;
    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
          heroTag: "btn2",
          elevation: 0,
          onPressed: () {
            postController.page2chack();
            if (postController.page2.value) {
              postController.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
              );
            }
          },
          icon: postController.page2.value
              ? const Icon(Feather.check, color: Colors.white)
              : const Icon(Feather.circle, color: Colors.white),
          // icon: postController.page2.value
          //     ? const Icon(Feather.check)
          //     : const Icon(Feather.zap),
          label: postController.page2.value
              ? const Text(
                  " NEXT  ",
                  style: TextStyle(color: Colors.white),
                )
              : const Text(
                  " Catagory ",
                  style: TextStyle(color: Colors.white),
                ),
          backgroundColor:
              postController.page2.value ? Colors.blueAccent : Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Post your Ad\'s',
                  style: TextStyle(fontSize: 24, letterSpacing: 1),
                ),
                Text(
                  'Please include some details',
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1,
                      color: Colors.black.withOpacity(0.3)),
                ),
                const SizedBox(height: 10),
                const CompanyBox(
                  title: 'Brand *',
                  title2: 'Model *',
                  typeofbike: 0,
                ),
                SizedBox(height: space),
                FullTextInputBoxTemp(
                  topPadding: toppadding,
                  title: "Ad title *",
                  textType: TextInputType.text,
                  hintText: "KTM Duke 200",
                  controller: postController.title,
                  icon: 'assets/icons/post/ptext.svg',
                  iconh: 21,
                  iconw: 21,
                ),
                SizedBox(height: space),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SmallFullTextInputBoxTemp(
                        topPadding: toppadding,
                        title: "Year *",
                        textType: TextInputType.number,
                        hintText: "2020",
                        titlelenth: 4,
                        suffixtext: "Y",
                        controller: postController.year,
                        iconh: 23,
                        iconw: 23,
                      ),
                      const SizedBox(width: 15),
                      SmallFullTextInputBoxTemp(
                        topPadding: toppadding,
                        title: "KM driven *",
                        suffixtext: "km",
                        textType: TextInputType.number,
                        hintText: "1000",
                        titlelenth: 9,
                        controller: postController.kmdriven,
                        iconh: 30,
                        iconw: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: space),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SmallFullTextInputBoxTemp(
                        topPadding: toppadding,
                        title: "Price *",
                        textType: TextInputType.number,
                        hintText: "৳ 2000",
                        titlelenth: 10,
                        suffixtext: "৳",
                        controller: postController.price,
                        iconh: 23,
                        iconw: 23,
                      ),
                      const SizedBox(width: 15),
                      ConditionBoxTemp(
                        topPadding: toppadding,
                        title: "Condition *",
                      ),
                    ],
                  ),
                ),
                DescriptionTextBox(
                  title: "Description *",
                  textType: TextInputType.text,
                  hintText:
                      "\nSpecify condition, features and reason for selling 👀",
                  controller: postController.description,
                  icon: Feather.file_text,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Select image *',
                  style: TextStyle(
                    color: Color(0xff7B7B7B),
                    letterSpacing: 0.7,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      SelectImage(
                        topPadding: 5,
                        icon: Feather.camera,
                        hintText: "Select Image",
                        imagnumber: 1,
                      ),
                      SizedBox(width: 10),
                      SelectImage(
                        topPadding: 5,
                        icon: Feather.camera,
                        hintText: "Select Image",
                        imagnumber: 2,
                      ),
                      SizedBox(width: 10),
                      SelectImage(
                        topPadding: 5,
                        icon: Feather.camera,
                        hintText: "Select Image",
                        imagnumber: 3,
                      ),
                      SizedBox(width: 10),
                      SelectImage(
                        topPadding: 5,
                        icon: Feather.camera,
                        hintText: "Select Image",
                        imagnumber: 4,
                      ),
                      SizedBox(width: 10),
                      SelectImage(
                        topPadding: 5,
                        icon: Feather.camera,
                        hintText: "Select Image",
                        imagnumber: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      );
    });
  }
}
