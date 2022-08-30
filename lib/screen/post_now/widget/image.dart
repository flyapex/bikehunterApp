import 'dart:convert';
import 'dart:io';
import 'package:bikehunter/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SelectImage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  // final title;
  final double topPadding;
  // ignore: prefer_typing_uninitialized_variables
  final icon;
  // ignore: prefer_typing_uninitialized_variables
  final hintText;
  final int imagnumber;
  const SelectImage({
    // required this.title,
    required this.icon,
    required this.hintText,
    this.topPadding = 10,
    Key? key,
    required this.imagnumber,
  }) : super(key: key);

  @override
  SelectImageState createState() => SelectImageState();
}

class SelectImageState extends State<SelectImage> {
  PostController postController = Get.find();
  ///////////////////////  image

  // ignore: prefer_typing_uninitialized_variables
  var selectedImage;
  final picker = ImagePicker();
  Future getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );

    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        var image = base64Encode(selectedImage.readAsBytesSync());
        if (widget.imagnumber == 1) {
          postController.image1 = image;
        } else if (widget.imagnumber == 2) {
          postController.image2 = image;
        } else if (widget.imagnumber == 3) {
          postController.image3 = image;
        } else if (widget.imagnumber == 4) {
          postController.image4 = image;
        } else if (widget.imagnumber == 5) {
          postController.image5 = image;
        }
        postController.page2chack();
      } else {
        // ignore: avoid_print
        print('No image selected.');
      }
    });
  }

///////////////////////  image
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: widget.topPadding),
        // Text(
        //   widget.title,
        //   style: const TextStyle(
        //     color: Color(0xff7B7B7B),
        //     letterSpacing: 0.7,
        //   ),
        // ),
        const SizedBox(height: 15),
        selectedImage == null
            ? Row(
                children: [
                  SizedBox(
                    height: 44,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () async {
                        getImage();
                      },
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(color: Colors.black.withOpacity(0.4)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: const <Widget>[
                            Icon(Icons.add_a_photo, color: Color(0xff7F6BFC)),
                            SizedBox(width: 10),
                            Text(
                              "Select Image",
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: Get.height / 4,
                width: Get.width / 3,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.file(selectedImage, fit: BoxFit.cover),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipOval(
                              child: Material(
                                color: const Color(0xff261C2C).withOpacity(0.5),
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {
                                    setState(() {
                                      selectedImage = null;
                                    });
                                  },
                                  child: SizedBox(
                                      width: 27,
                                      height: 27,
                                      child: Icon(
                                        Feather.x,
                                        color: Colors.white.withOpacity(0.9),
                                        size: 20,
                                      )),
                                ),
                              ),
                            ),
                          )
                          // CircleAvatar(
                          //   radius: 20,
                          //   backgroundColor: Colors.white,
                          //   child: IconButton(
                          //     padding: EdgeInsets.zero,
                          //     splashRadius: 40,
                          //     splashColor:
                          //         Colors.lightBlueAccent.withOpacity(0.3),
                          //     onPressed: () {
                          // setState(() {
                          //   selectedImage = null;
                          // });
                          //     },
                          //     icon: Icon(
                          //       Feather.x_circle,
                          //       color: Colors.blueGrey[300],
                          //       size: 30,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
