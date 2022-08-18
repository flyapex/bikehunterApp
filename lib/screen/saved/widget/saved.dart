import 'package:flutter/material.dart';

class FaouritePage extends StatelessWidget {
  const FaouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.purpleAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(child: Text('User Page')),
        ),
      ),
    );
  }
}
