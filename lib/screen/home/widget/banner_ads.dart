import 'dart:async';
import 'dart:convert';
import 'package:bikehunter/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlide extends StatefulWidget {
  final double topPadding;
  final double hight;
  const ImageSlide({
    this.topPadding = 0,
    Key? key,
    required this.hight,
  }) : super(key: key);

  @override
  State<ImageSlide> createState() => _ImageSlideState();
}

class _ImageSlideState extends State<ImageSlide> {
  final PageController pageController = PageController(initialPage: 0);
  final PostController adsController = Get.put(PostController());

  int _currentPage = 0;
  late Timer _timer;

  Future getBannerAds() async {
    if (adsController.fatchOneTime.value) {
      await adsController.bannerAdsApi();
    }
  }

  @override
  void initState() {
    getBannerAds();
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < adsController.banneradsList.length) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    // adsController.banneradsList.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.hight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Obx(
        (() {
          return adsController.bannerLoding.value
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    PageView.builder(
                      controller: pageController,
                      itemCount: adsController.banneradsList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              // image: ExactAssetImage(e
                              //   'assets/images/bikeimage${index + 1}.png',
                              // ),
                              image: MemoryImage(
                                base64Decode(
                                  adsController.banneradsList[index].image,
                                ),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      onPageChanged: (index) {},
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: adsController.banneradsList.length,
                          effect: const ExpandingDotsEffect(
                            dotWidth: 7.5,
                            dotHeight: 7.5,
                            spacing: 10,
                            dotColor: Colors.white,
                            activeDotColor: Colors.white,
                          ),
                          onDotClicked: (index) {
                            // setState(() {
                            //   _currentPage = index;
                            // });
                          },
                        ),
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
