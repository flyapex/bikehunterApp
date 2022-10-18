import 'package:flutter/material.dart';

class PageForStore extends StatelessWidget {
  const PageForStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.orange,
        child: const Text("page for cycle"),
      ),
    );
  }
}
