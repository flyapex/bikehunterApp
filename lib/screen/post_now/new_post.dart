import 'package:bikehunter/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final PostController postController = Get.put(PostController());
  @override
  void dispose() {
    postController.cappedCatagoryInxed.value = 10;
    postController.page1.value = false;
    postController.page2.value = false;
    postController.page3.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    postController.bottomSheetSize.value = Get.height / 1.4;
    postController.bottomSheetSize.value = Get.height - 80;

    var pageController = postController.pageController;

    return Obx(
      (() {
        return Listener(
          onPointerUp: (opu) {
            postController.bottomSheetSize.value = Get.height - 80;
          },
          child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 100),
            height: postController.bottomSheetSize.value,
            width: Get.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
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
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 12,
                    dotHeight: 12,
                    spacing: 10,
                    dotColor: Colors.greenAccent,
                    activeDotColor: Colors.blueAccent,
                  ),
                  onDotClicked: (index) {},
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (int i) {
                      // postController.currentPage.value = i;
                      // print(i);
                      // unselectedMessage() {
                      //   // postController.pageController.jumpToPage(0);
                      //   // final scaffold = ScaffoldMessenger.of(context);
                      //   // scaffold.showSnackBar(
                      //   //   SnackBar(
                      //   //     content: const Text('Added to favorite'),
                      //   //     action: SnackBarAction(
                      //   //       label: 'ok',
                      //   //       onPressed: scaffold.hideCurrentSnackBar,
                      //   //     ),
                      //   //   ),
                      //   // );

                      //   Get.snackbar(
                      //     "Catagory🤔",
                      //     "Select Catagory",
                      //     icon:
                      //         const Icon(Icons.check_box, color: Colors.white),
                      //     snackPosition: SnackPosition.BOTTOM,
                      //     backgroundColor: Colors.redAccent,
                      //     borderRadius: 7,
                      //     margin: const EdgeInsets.only(
                      //       left: 15,
                      //       right: 15,
                      //       bottom: 20,
                      //     ),
                      //     padding: const EdgeInsets.all(6),
                      //     colorText: Colors.white,
                      //     duration: const Duration(seconds: 2),
                      //     isDismissible: true,
                      //     dismissDirection: DismissDirection.horizontal,
                      //     forwardAnimationCurve: Curves.easeInOutQuad,
                      //   );
                      // }

                      // postController.page1.value
                      //     ? postController.pageController.nextPage(
                      //         duration: const Duration(milliseconds: 300),
                      //         curve: Curves.bounceInOut,
                      //       )
                      //     : unselectedMessage();
                      // postController.pageindecatorIndex.value = i;
                      // print(1 + i);
                    },
                    children: const [
                      Page1(),
                      Page2(),
                      Page3(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
