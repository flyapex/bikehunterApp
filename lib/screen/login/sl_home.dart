import 'package:bikehunter/controller/db_controller.dart';
import 'package:bikehunter/screen/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'signup.dart';

class SLHome extends StatefulWidget {
  const SLHome({Key? key}) : super(key: key);

  @override
  State<SLHome> createState() => _SLHomeState();
}

class _SLHomeState extends State<SLHome> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/video/1.mp4")
      ..initialize().then((value) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final DBController dbController = Get.find();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          // Container(
          //   color: Colors.deepPurpleAccent,
          // ),
          const SignUpWidget(),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 22),
                child: InkWell(
                  onTap: () {
                    dbController.saveUserId(0);
                    Get.offAll(
                      const HomeView(),
                      transition: Transition.circularReveal,
                      duration: const Duration(milliseconds: 600),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
