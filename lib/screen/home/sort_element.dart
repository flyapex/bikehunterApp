import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SortElement extends StatelessWidget {
  const SortElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (opu) {},
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 100),
        height: Get.height / 1.3,
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
          children: [
            Stack(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
