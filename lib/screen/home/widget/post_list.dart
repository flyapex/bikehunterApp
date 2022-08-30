import 'dart:convert';
import 'package:bikehunter/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'post_page.dart';

class Post extends StatelessWidget {
  final PostListRecModel postData;
  // ignore: prefer_typing_uninitialized_variables
  final snapshot;
  // ignore: prefer_typing_uninitialized_variables
  final currentINDEX;

  const Post({
    Key? key,
    required this.postData,
    required this.snapshot,
    required this.currentINDEX,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    // getShortForm(String val) {
    //   var shortForm = "";
    //   var tralling = 0;

    //   var number = int.parse(val == '' ? '0' : val);
    //   if (number < 1000) {
    //     shortForm = number.toString();
    //   } else if (number >= 1000 && number < 1000000) {
    //     shortForm = (number / 1000).toStringAsFixed(tralling) + "K";
    //   } else if (number >= 1000000 && number < 1000000000) {
    //     shortForm = (number / 1000000).toStringAsFixed(tralling) + "M";
    //   } else if (number >= 1000000000 && number < 1000000000000) {
    //     shortForm = (number / 1000000000).toStringAsFixed(tralling) + "B";
    //   }
    //   return shortForm;
    // }

    addComma(val) {
      var data = val.replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      return data;
    }

    return InkWell(
      onTap: () {
        Get.to(
          PostPage(
            postid: snapshot.data[currentINDEX].postId,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(0.2), width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            postData.image1 != ''
                ? Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        // image: ExactAssetImage(e
                        //   'assets/images/bikeimage${index + 1}.png',
                        // ),
                        image: MemoryImage(base64Decode(postData.image1)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 8, top: 8, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Text(
                  //   '৳ ' + getShortForm(postData.price),
                  //   style: const TextStyle(
                  //     fontSize: 18,
                  //     // color: TextColors.maintextColor,
                  //     color: Color(0xfff77f00),
                  //   ),
                  // ),
                  Text(
                    postData.city,
                    style: const TextStyle(
                      fontSize: 11,
                      //! color: TextColors.hinttextColor,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    postData.year.toString() +
                        '-' +
                        addComma(postData.kmDriven.toString()) +
                        ' km',
                    style: const TextStyle(
                      fontSize: 11,
                      letterSpacing: 0.5,
                      //! color: TextColors.hinttextColor,
                    ),
                  ),
                  Text(
                    postData.title,
                    style: const TextStyle(
                      fontSize: 11,
                      //! color: TextColors.taitletextColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        '৳ ' + addComma(postData.price),
                        style: const TextStyle(
                          fontSize: 17,
                          // color: TextColors.maintextColor,
                          color: Color(0xfff77f00),
                          height: 0.3,
                        ),
                      ),
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        timeago.format(postData.postTime, locale: 'en_short') +
                            ' ago',
                        style: const TextStyle(
                          fontSize: 11,
                          //! color: TextColors.hinttextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
