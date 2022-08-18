import 'package:bikehunter/constants/colors.dart';
import 'package:bikehunter/controller/db_controller.dart';
import 'package:bikehunter/controller/navigation_controller.dart';
import 'package:bikehunter/screen/home/widget/app_bar.dart';
import 'package:bikehunter/screen/signup/sl_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NavbarController postController = Get.put(NavbarController());
  final DBController dbController = Get.put(DBController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          dbController.saveUserId(0);
          Get.offAll(() => const SLHome());
        },
        child: const Icon(
          Feather.log_out,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              const CustomeAppBar(),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(
                        "FEATURED",
                        style: TextStyle(
                          fontSize: 10,
                          color: kTEXT1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
