// import 'package:bikehunter/api/model/postmodel.dart';
// import 'package:bikehunter/controller/navigationcontroller.dart';
// import 'package:bikehunter/utils/colors.dart';
// import 'package:flutter_share_me/flutter_share_me.dart';
import 'dart:convert';
import 'dart:ui';

import 'package:bikehunter/controller/post_controller.dart';
import 'package:bikehunter/model/post_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'imageslide_post_page.dart';

class PostPage extends StatefulWidget {
  final int postid;
  const PostPage({
    Key? key,
    required this.postid,
  }) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostController postController = Get.find();

  getData(int postid) async {
    await postController.getSinglePost(postid);
  }

  @override
  void initState() {
    getData(widget.postid);
    super.initState();
  }

  @override
  void dispose() {
    postController.pagepostlist.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: postController.pagepostlist.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return PageView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              onPageChanged: (i) {
                if (i == postController.pagepostlist.length) {
                  getData(postController.pagepostlist[i - 2].postId);
                }
              },
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index < snapshot.data.length) {
                  return PostPageDesign(
                    data: snapshot.data[index],
                  );
                } else {
                  return Obx(
                    (() => postController.pagepostlistLoding.value
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text('nothing more to load!'),
                            ),
                          )),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}

class PostPageDesign extends StatelessWidget {
  final SinglePostModel data;
  const PostPageDesign({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    addComma(val) {
      var data = val.replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      return data;
    }

    imageListMaking() {
      var imageList = [];
      // for (int i = 1; i < 6; i++) {
      //   if ('${data.image}$i' != '') {
      //     String image = '${data.image}$i';
      //     imageList.add(image);
      //   }
      // }
      // print('Image 1' + imageList[0]);

      if (data.image1 != '') {
        imageList.add(data.image1);
      }
      if (data.image2 != '') {
        imageList.add(data.image2);
      }
      if (data.image3 != '') {
        imageList.add(data.image3);
      }
      if (data.image4 != '') {
        imageList.add(data.image4);
      }
      if (data.image5 != '') {
        imageList.add(data.image5);
      }
      // print(imageList[0]);
      return imageList;
    }

    return DefaultTextStyle(
      style: const TextStyle(color: Colors.black),
      child: Container(
        color: const Color(0xffF8F9FD),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Stack(
            children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Colors.greenAccent, Colors.cyan],
                    ),
                  ),
                ),
              ),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 350,
                  width: double.infinity,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      margin: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Center(
                        child: Text(
                          "ADS",
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            ImageSlidePage(
                              hight: 350,
                              imagelist: imageListMaking(),
                            ),
                            // data.image1 == ''
                            //     ? Container(
                            //         height: 350,
                            //         width: double.infinity,
                            //         decoration: BoxDecoration(
                            //           color: Colors.pink,
                            //           borderRadius: BorderRadius.circular(6),
                            //         ),
                            //         child: const Icon(Feather.image,
                            //             color: Colors.white),
                            //       )
                            //     : Container(
                            //         height: 350,
                            //         width: double.infinity,
                            //         margin: const EdgeInsets.only(top: 20),
                            //         decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(3),
                            //           image: DecorationImage(
                            //             image: MemoryImage(
                            //               base64Decode(
                            //                 data.image1,
                            //               ),
                            //             ),
                            //             fit: BoxFit.cover,
                            //           ),
                            //         ),
                            //         child: Stack(
                            //           children: [
                            //             ClipRRect(
                            //               borderRadius:
                            //                   BorderRadius.circular(3),
                            //               child: BackdropFilter(
                            //                 filter: ImageFilter.blur(
                            //                     sigmaX: 2, sigmaY: 2),
                            //                 child: Container(
                            //                   alignment: Alignment.center,
                            //                   color:
                            //                       Colors.grey.withOpacity(0.1),
                            //                   child: Image.memory(
                            //                     base64Decode(data.image1),
                            //                     fit: BoxFit.fitHeight,
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(10.0),
                            //               child: Align(
                            //                 alignment: Alignment.bottomRight,
                            //                 child: SvgPicture.asset(
                            //                   'assets/icons/logo.svg',
                            //                   color: Colors.white,
                            //                   height: 20,
                            //                 ),
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '৳ ${addComma(data.price)}',
                                      style: const TextStyle(
                                        fontFamily: 'Helvetica',
                                        fontSize: 20,
                                        color: Color(0xff834FE2),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Feather.check_circle,
                                    color: Colors.yellowAccent[700],
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  data.title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    //! color: TextColors.taitletextColor,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 2,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            DefaultTextStyle(
                              style: const TextStyle(
                                color: Color(0xff8595A9),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Feather.map_pin,
                                            //! color: TextColors.hinttextColor,
                                            size: 17,
                                          ),
                                          Text(" ${data.city}"),
                                        ],
                                      ),
                                      Text(
                                        // ignore: prefer_interpolation_to_compose_strings
                                        timeago.format(data.postTime,
                                                locale: 'en_short') +
                                            ' ago',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          //! color: TextColors.hinttextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
                      margin: const EdgeInsets.only(top: 10),
                      color: const Color(0xffE5E5E5),
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                        bottom: 0,
                        top: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Center(
                        child: Text("ADS"),
                      ),
                    ),
                    Container(
                      height: 10,
                      margin: const EdgeInsets.only(top: 10),
                      color: const Color(0xffE5E5E5),
                    ),
                    Container(
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(top: 15, left: 25, right: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultTextStyle(
                              style: const TextStyle(
                                color: Color(0xff8595A9),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Details",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.green[400],
                                          letterSpacing: 0.9,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/home/pbrand.svg',
                                                color: const Color(0xff8595A9)
                                                    .withOpacity(0.5),
                                                width: 24,
                                                height: 24,
                                              ),
                                              const Text(" Brand"),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/home/pmodel.svg',
                                                color: const Color(0xff8595A9)
                                                    .withOpacity(0.5),
                                                width: 24,
                                                height: 24,
                                              ),
                                              const Text(" Model"),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/home/pyear.svg',
                                                color: const Color(0xff8595A9)
                                                    .withOpacity(0.5),
                                                width: 24,
                                                height: 24,
                                              ),
                                              const Text(" Year"),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/home/pkm.svg',
                                                color: const Color(0xff8595A9)
                                                    .withOpacity(0.5),
                                                width: 22,
                                                height: 22,
                                              ),
                                              const Text("  KM Driven"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 24,
                                            child: Center(
                                              child: Text(
                                                data.brand,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24,
                                            child: Center(
                                              child: Text(
                                                data.model,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24,
                                            child: Center(
                                              child: Text(
                                                "${data.year}",
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24,
                                            child: Center(
                                              child: Text(
                                                "${addComma(data.kmDriven.toString())} km",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Feather.list,
                                        color: const Color(0xff8595A9)
                                            .withOpacity(0.5),
                                        size: 18,
                                      ),
                                      const Text(
                                          "  WHAT IS EXPECTED FROM THE BIKE?"),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF8F9FD),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "${data.postId}",
                                        textAlign: TextAlign.justify,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: Get.width / 4,
                      margin: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          data.fb == ''
                              ? Container()
                              : const SizedBox(width: 10),
                          data.fb == ''
                              ? Container()
                              : Expanded(
                                  child: ElevatedButton(
                                    // ignore: sort_child_properties_last
                                    child: SizedBox(
                                      height: Get.width / 9,
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/home/pfb.svg',
                                          color: Colors.white,
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueAccent,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                ),
                          data.wappnumber == ''
                              ? Container()
                              : const SizedBox(width: 10),
                          data.wappnumber == ''
                              ? Container()
                              : Expanded(
                                  child: ElevatedButton(
                                    // ignore: sort_child_properties_last
                                    child: SizedBox(
                                      height: Get.width / 9,
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/home/pwapp.svg',
                                          color: Colors.white,
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      // Uint8List bytes =
                                      //     base64.decode(data.image1);
                                      // final decodedBytes =
                                      //     base64Decode(data.image1);
                                      // final directory =
                                      //     await getApplicationDocumentsDirectory();
                                      // var fileImg = File(
                                      //     '${directory.path}/adsImage.png');
                                      // print(fileImg.path);
                                      // fileImg.writeAsBytesSync(
                                      //     List.from(decodedBytes));
                                      // var image =
                                      //     await base64Decode(data.image1);
                                      // await Share.shareFiles(
                                      //   ['$image'],
                                      //   text:
                                      //       'Hi ${data.name}, I found this ads on OlxBike, is it still available?',
                                      // );
                                      // var image =
                                      //     await base64Decode(data.image1);
                                      // await WhatsappShare.shareFile(
                                      //   text:
                                      //       'Hi ${data.name}, I found this ads on OlxBike, is it still available?',
                                      //   phone: data.wanumber,
                                      //   filePath: [
                                      //     ['$image'],
                                      //   ],
                                      // );

                                      // var image = base64.decode(data.image1);
                                      // final Uint8List bytes = stuff.buffer.asUint8List();
                                      // var wappNumber = data.wanumber;
                                      // var message =
                                      //     'Hi ${data.name}, I found this ads on OlxBike, is it still available?';
                                      // var whatsAppUrl =
                                      //     'https://wa.me/+$wappNumber?text=${Uri.parse(message)}';
                                      // launch(whatsAppUrl);

                                      //*----------------------
                                      // FlutterShareMe()
                                      //     .shareWhatsAppPersonalMessage(
                                      //   message: '',
                                      //   phoneNumber: data.wappnumber,
                                      // );
                                      //*----------------------
                                      // final ByteData image = await base64
                                      //     .decode(data.image1)
                                      //     .buffer
                                      //     .asByteData();
                                      // Share.shareFiles(['$image'],
                                      //     text: 'Great picture');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.lightGreen,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                ),
                          data.phone == ''
                              ? Container()
                              : const SizedBox(width: 10),
                          data.phone == ''
                              ? Container()
                              : Expanded(
                                  child: ElevatedButton(
                                    // ignore: sort_child_properties_last
                                    child: SizedBox(
                                      height: Get.width / 9,
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/home/pcall.svg',
                                          color: Colors.white,
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      // ignore: deprecated_member_use
                                      await launch("tel:${data.phone}");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff6E7FFC),
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      margin: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Center(
                        child: Text(
                          "ADS",
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(400, 0);

    path.quadraticBezierTo(3 / 4 * size.width, 150, size.width, 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

//!-----------------------------------------------------Image Slider
class ImageSlidePage extends StatefulWidget {
  final double topPadding;
  final double hight;

  // ignore: prefer_typing_uninitialized_variables
  final imagelist;
  const ImageSlidePage({
    this.topPadding = 0,
    Key? key,
    required this.hight,
    required this.imagelist,
  }) : super(key: key);

  @override
  State<ImageSlidePage> createState() => _ImageSlidePageState();
}

class _ImageSlidePageState extends State<ImageSlidePage> {
  final PageController pageController = PageController(initialPage: 0);
  // ignore: prefer_typing_uninitialized_variables, unused_field
  var _currentPage;
  @override
  void initState() {
    // pageController.addListener(() {
    //   setState(() {
    //     _currentPage = _currentPage.page.toInt();
    //   });
    // });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          ImageFullView(
            currentPage: pageController.page!.toInt(),
            imagelist: widget.imagelist,
          ),
        );
      },
      child: Container(
        height: 350,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            PageView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              controller: pageController,
              itemCount: widget.imagelist.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        image: DecorationImage(
                          image: MemoryImage(
                            base64Decode(
                              widget.imagelist[index],
                            ),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.grey.withOpacity(0.1),
                          child: Image.memory(
                            base64Decode(
                              widget.imagelist[index],
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              onPageChanged: (index) {},
            ),
            widget.imagelist.length == 1
                ? Container()
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: widget.imagelist.length,
                        effect: const ExpandingDotsEffect(
                          dotWidth: 7.5,
                          dotHeight: 7.5,
                          spacing: 10,
                          dotColor: Colors.white,
                          activeDotColor: Colors.white,
                        ),
                        onDotClicked: (index) {},
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(
                  'assets/icons/home/logo.svg',
                  color: Colors.white,
                  height: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageFullView extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final currentPage;
  // ignore: prefer_typing_uninitialized_variables
  final imagelist;
  const ImageFullView({
    Key? key,
    this.currentPage,
    this.imagelist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController =
        PageController(initialPage: currentPage);
    return Scaffold(
      body: InkWell(
        onDoubleTap: () {
          Get.back();
        },
        child: SizedBox(
          // height: 350,
          width: double.infinity,

          child: Stack(
            children: [
              PageView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                controller: pageController,
                itemCount: imagelist.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                          image: DecorationImage(
                            image: MemoryImage(
                              base64Decode(
                                imagelist[index],
                              ),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.grey.withOpacity(0.1),
                            child: Image.memory(
                              base64Decode(
                                imagelist[index],
                              ),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                onPageChanged: (index) {},
              ),
              imagelist.length == 1
                  ? Container()
                  : SafeArea(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SmoothPageIndicator(
                            controller: pageController,
                            count: imagelist.length,
                            effect: const ExpandingDotsEffect(
                              dotWidth: 7.5,
                              dotHeight: 7.5,
                              spacing: 10,
                              dotColor: Colors.white,
                              activeDotColor: Colors.white,
                            ),
                            onDotClicked: (index) {},
                          ),
                        ),
                      ),
                    ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset(
                      'assets/icons/home/logo.svg',
                      color: Colors.white,
                      height: 21,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
