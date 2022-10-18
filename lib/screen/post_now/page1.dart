import 'package:bikehunter/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    final PostController postController = Get.put(PostController());

    return Obx((() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
          heroTag: "btn1",
          elevation: 0,
          onPressed: () {
            unselectedMessage() {
              postController.pageController.jumpToPage(0);

              Get.snackbar(
                "Catagory🤔",
                "Select Catagory",
                icon: const Icon(Icons.check_box, color: Colors.white),
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.redAccent,
                borderRadius: 7,
                margin: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 20,
                ),
                padding: const EdgeInsets.all(6),
                colorText: Colors.white,
                duration: const Duration(seconds: 2),
                isDismissible: true,
                dismissDirection: DismissDirection.horizontal,
                forwardAnimationCurve: Curves.easeInOutQuad,
              );
            }

            postController.page1.value
                ? postController.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  )
                : unselectedMessage();
            // postController.page1.value
            //     ? postController.pageController.nextPage(
            //         duration: const Duration(milliseconds: 300),
            //         curve: Curves.bounceInOut,
            //       )
            //     : unselectedMessage();
            //check if page 1 was selecterd or not
            // postController.pageController.nextPage(
            //   duration: const Duration(milliseconds: 300),
            //   curve: Curves.bounceInOut,
            // );
          },
          icon: postController.page1.value
              ? const Icon(Feather.check, color: Colors.white)
              : const Icon(Feather.circle, color: Colors.white),
          label: postController.page1.value
              ? const Text(
                  " NEXT  ",
                  style: TextStyle(color: Colors.white),
                )
              : const Text(
                  " Catagory ",
                  style: TextStyle(color: Colors.white),
                ),
          backgroundColor:
              postController.page1.value ? Colors.blueAccent : Colors.black,
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Bike Type',
                  style: TextStyle(fontSize: 24, letterSpacing: 1),
                ),
                Text(
                  'Please chose your bike category',
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1,
                      color: Colors.black.withOpacity(0.3)),
                ),
                const SizedBox(height: 20),
                GridView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    children: const [
                      CatagoryBox(
                        size: 60.0,
                        svg: 'assets/icons/post/bike.svg',
                        txt: "Motorcycles",
                        index: 0,
                      ),
                      CatagoryBox(
                        size: 60.0,
                        svg: 'assets/icons/post/cycle.svg',
                        txt: "Bicycles",
                        index: 1,
                      ),
                      CatagoryBox(
                        size: 60.0,
                        svg: 'assets/icons/post/scooter.svg',
                        txt: "Scooters",
                        index: 2,
                      ),
                      CatagoryBox(
                        size: 60.0,
                        svg: 'assets/icons/post/parts.svg',
                        txt: "Spare Parts",
                        index: 3,
                      ),
                    ]),
              ],
            ),
          ),
        ),
      );
    }));
  }
}

class CatagoryBox extends StatelessWidget {
  final double size;
  final String txt;
  final String svg;
  final int index;

  const CatagoryBox(
      {Key? key,
      required this.size,
      required this.txt,
      required this.svg,
      required this.index})
      : super(key: key);

  @override
  build(BuildContext context) {
    final PostController postController = Get.find();
    return Obx(
      (() {
        return Container(
          decoration: BoxDecoration(
            color: index == postController.cappedCatagoryInxed.value
                ? const Color(0xff304FFF)
                : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(4, 8),
              )
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                postController.cappedCatagoryInxed.value = index;
                postController.page1.value = true;
                // postController.pageController.nextPage(
                //   duration: const Duration(milliseconds: 300),
                //   curve: Curves.bounceInOut,
                // );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        FontAwesome.check_circle,
                        // Feather.check_circle,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(),
                      const SizedBox(),
                      SizedBox(
                        height: size,
                        width: size,
                        child: SvgPicture.asset(svg),
                      ),
                      Text(
                        txt,
                        style: TextStyle(
                          fontSize: 18,
                          color:
                              index == postController.cappedCatagoryInxed.value
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(),
                      const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

// class CatagoryBox extends Stateful{
//   final double size;
//   final String txt;
//   final String svg;

//   const CatagoryBox({
//     Key? key,
//     required this.size,
//     required this.txt,
//     required this.svg,
//   }) : super(key: key);

//   @override
//   State<CatagoryBox> createState() => _CatagoryBoxState();
// }

// class _CatagoryBoxState extends State<CatagoryBox> {
//   final postController postController = Get.find();
//   @override
//   build(BuildContext context) {
//     return Obx(
//       (() {
//         return Container(
//           decoration: BoxDecoration(
//             color: postController.cappedCatagoryInxed.value == true
//                 ? Colors.red
//                 : Colors.white,
//             borderRadius: BorderRadius.circular(15),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 blurRadius: 10,
//                 offset: const Offset(4, 8),
//               )
//             ],
//           ),
//           child: Material(
//             color: Colors.transparent,
//             child: InkWell(
//               onTap: () {
//                 postController.cappedCatagoryInxed.value = true;
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   const SizedBox(),
//                   const SizedBox(),
//                   SizedBox(
//                     height: size,
//                     width: size,
//                     child: SvgPicture.asset(svg),
//                   ),
//                   Text(
//                     txt,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black.withOpacity(0.6),
//                     ),
//                   ),
//                   const SizedBox(),
//                   const SizedBox(),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
