import 'package:bikehunter/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/accessories.dart';
import 'widget/bike.dart';
import 'widget/scooters.dart';
import 'widget/store.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.put(PostController());

    return Obx((() {
      if (postController.cappedCatagoryInxed.value == 0) {
        return const PageForBike();
      } else if (postController.cappedCatagoryInxed.value == 1) {
        return const PageForStore();
      } else if (postController.cappedCatagoryInxed.value == 2) {
        return const PageForScooters();
      } else if (postController.cappedCatagoryInxed.value == 3) {
        return const PageForAccessories();
      } else {
        return const EmptyPage();
      }
    }));
  }
}

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Did You Forgate about Catagory?",
          style: TextStyle(
            color: Colors.black.withOpacity(0.4),
            letterSpacing: 0.7,
            fontSize: 20,
            fontFamily: "h2",
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Select Catagory",
          style: TextStyle(
            color: Colors.orange,
            letterSpacing: 0.7,
            fontSize: 30,
            fontFamily: "h3",
          ),
        ),
        const SizedBox(height: 300),
      ],
    );
  }
}
