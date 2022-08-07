import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: _buildAppBar(),
        body: Center(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.redAccent,
      ),
    )
        // bottomNavigationBar: _buildBottomNavigationBar(),
        );
  }
}
