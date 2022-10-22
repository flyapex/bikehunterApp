import 'package:flutter/material.dart';

// ignore: camel_case_types
class Searched_bikes extends StatelessWidget {
  const Searched_bikes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child: const Center(child: Text('Under development')),
        ),
      ),
    );
  }
}
