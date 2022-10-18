import 'package:flutter/material.dart';

class PageForAccessories extends StatelessWidget {
  const PageForAccessories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.pink,
        child: const Text("page for Accessories"),
      ),
    );
  }
}
