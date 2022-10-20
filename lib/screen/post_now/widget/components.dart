import 'package:bikehunter/controller/post_controller.dart';
import 'package:bikehunter/model/bike_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class CompanyBox extends StatefulWidget {
  final String title;
  final String title2;
  final double topPadding;
  final int typeofbike;
  const CompanyBox(
      {Key? key,
      required this.title,
      this.topPadding = 10,
      required this.title2,
      required this.typeofbike})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CompanyBoxState createState() => _CompanyBoxState();
}

class _CompanyBoxState extends State<CompanyBox> {
  PostController postController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: widget.topPadding),
              Text(
                widget.title,
                style: const TextStyle(
                  // color: Color(0xff7B7B7B),
                  //! color: TextColors.taitletextColor,
                  letterSpacing: 0.7,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xffF2F3F5),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      isExpanded: true,
                      icon: const Icon(Feather.chevron_down),
                      hint: Text(postController.companytxt.value),
                      items: widget.typeofbike == 0
                          ? company.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()
                          : companys.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                      onChanged: (val) {
                        postController.companytxt.value = val.toString();
                        postController.modelChack(widget.typeofbike);
                        postController.page2chack();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: widget.topPadding),
              Text(
                widget.title2,
                style: const TextStyle(
                  color: Color(0xff7B7B7B),
                  letterSpacing: 0.7,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xffF2F3F5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      itemHeight: 50,
                      isExpanded: true,
                      icon: const Icon(Feather.chevron_down),
                      hint: Text(postController.moideltxt.value),
                      items: postController.moidellist.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        postController.moideltxt.value = val.toString();
                        postController.page2chack();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FullTextInputBoxTemp extends StatefulWidget {
  final String title;
  final String icon;
  final String hintText;
  final TextInputType textType;
  final double topPadding;
  final double bottomPadding;
  final TextEditingController controller;
  final double iconh;
  final double iconw;
  const FullTextInputBoxTemp(
      {required this.title,
      required this.icon,
      required this.textType,
      required this.hintText,
      this.topPadding = 10,
      required this.controller,
      required this.iconh,
      required this.iconw,
      Key? key,
      this.bottomPadding = 15})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FullTextInputBoxTempState createState() => _FullTextInputBoxTempState();
}

class _FullTextInputBoxTempState extends State<FullTextInputBoxTemp> {
  PostController postController = Get.find();
  var iconColorChange = false;
  var textstyle = const TextStyle(
    overflow: TextOverflow.fade,
    //! color: TextColors.maintextColor,
    height: 1.2,
    fontSize: 16,
    letterSpacing: 1.2,
  );
  var textstyleh = const TextStyle(
    overflow: TextOverflow.fade,
    height: 1.2,
    //! color: TextColors.hinttextColor,
    fontSize: 15,
    letterSpacing: 1.2,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: widget.topPadding),
        Text(
          widget.title,
          style: const TextStyle(
            //! color: TextColors.taitletextColor,
            letterSpacing: 0.7,
          ),
        ),
        SizedBox(height: widget.bottomPadding),
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xffF2F3F5),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.white),
          ),
          child: Row(children: [
            Container(
                height: widget.iconh,
                width: widget.iconw,
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: SvgPicture.asset(
                  widget.icon,
                  color: iconColorChange
                      ? Colors.blueAccent
                      : Colors.black.withOpacity(0.5),
                )),
            Expanded(
              child: Focus(
                onFocusChange: (val) {
                  setState(() {
                    val ? iconColorChange = true : iconColorChange = false;
                  });
                },
                child: TextField(
                  cursorHeight: 22,
                  cursorWidth: 1.8,
                  cursorRadius: const Radius.circular(10),
                  controller: widget.controller,
                  textInputAction: TextInputAction.next,
                  keyboardType: widget.textType,
                  maxLines: 1,
                  cursorColor: Colors.black,
                  style: textstyle,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    isDense: true,
                    hintText: widget.hintText,
                    hintStyle: textstyleh,
                  ),
                  onChanged: (val) {
                    postController.page2chack();
                  },
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class SmallFullTextInputBoxTemp extends StatefulWidget {
  final String title;
  final int titlelenth;
  final String hintText;
  final String suffixtext;
  final TextInputType textType;
  final double topPadding;
  final TextEditingController controller;
  final double iconh;
  final double iconw;

  const SmallFullTextInputBoxTemp({
    required this.title,
    required this.hintText,
    required this.textType,
    this.topPadding = 10,
    required this.controller,
    required this.suffixtext,
    required this.titlelenth,
    required this.iconh,
    required this.iconw,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SmallFullTextInputBoxTempState createState() =>
      _SmallFullTextInputBoxTempState();
}

class _SmallFullTextInputBoxTempState extends State<SmallFullTextInputBoxTemp> {
  PostController postController = Get.find();
  var textstyle = const TextStyle(
    overflow: TextOverflow.fade,
    // color: Colors.black,
    //! color: TextColors.maintextColor,
    height: 1.2,
    fontSize: 16,
    letterSpacing: 1.2,
  );
  var textstyleh = const TextStyle(
    overflow: TextOverflow.fade,
    height: 1.2,
    //! color: TextColors.hinttextColor,
    fontSize: 15,
    letterSpacing: 1.2,
  );
  var iconColorChange = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: widget.topPadding),
        Text(
          widget.title,
          style: const TextStyle(
            //! color: TextColors.taitletextColor,
            letterSpacing: 0.7,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffF2F3F5),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 48,
                width: (Get.width / 2) - 20,
                child: Focus(
                  onFocusChange: (val) {
                    setState(() {
                      val ? iconColorChange = true : iconColorChange = false;
                    });
                  },
                  child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(widget.titlelenth),
                    ],
                    // maxLength: widget.titlelenth,
                    cursorHeight: 24,
                    cursorWidth: 1.8,
                    cursorRadius: const Radius.circular(10),
                    controller: widget.controller,
                    textInputAction: TextInputAction.next,
                    keyboardType: widget.textType,
                    maxLines: 1,
                    cursorColor: Colors.black,
                    style: textstyle,
                    decoration: InputDecoration(
                      suffix: Text(widget.suffixtext),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      isDense: true,
                      hintText: widget.hintText,
                      hintStyle: textstyleh,
                    ),
                    onChanged: (val) {
                      if (val != '') {
                        // postController.istitletxt.value == true;
                        // widget.flag = true;
                        postController.page2chack();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DescriptionTextBox extends StatefulWidget {
  final String title;
  final IconData icon;
  final String hintText;
  final TextInputType textType;
  final double topPadding;
  final TextEditingController controller;
  const DescriptionTextBox(
      {Key? key,
      required this.title,
      required this.icon,
      required this.hintText,
      required this.textType,
      this.topPadding = 10,
      required this.controller})
      : super(key: key);

  @override
  DescriptionTextBoxState createState() => DescriptionTextBoxState();
}

class DescriptionTextBoxState extends State<DescriptionTextBox> {
  PostController postController = Get.find();
  var textstyle = const TextStyle(
    overflow: TextOverflow.fade,
    // color: Colors.black,
    //! color: TextColors.maintextColor,
    height: 1.2,
    fontSize: 16,
    letterSpacing: 1.2,
  );
  var textstyleh = const TextStyle(
    overflow: TextOverflow.fade,
    height: 1.2,
    // color: Colors.black.withOpacity(0.40),
    //! color: TextColors.hinttextColor,
    fontSize: 15,
    letterSpacing: 1.2,
  );
  var iconColorChange = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: widget.topPadding),
        Text(
          widget.title,
          style: const TextStyle(
            //! color: TextColors.taitletextColor,
            letterSpacing: 0.7,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 170,
          width: Get.width,
          decoration: BoxDecoration(
            color: const Color(0xffF2F3F5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white),
          ),
          child: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.only(left: 5, top: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    widget.icon,
                    color: iconColorChange
                        ? Colors.blueAccent
                        : Colors.black.withOpacity(0.5),
                  ),
                ),
                Expanded(
                  child: Focus(
                    onFocusChange: (val) {
                      setState(() {
                        val ? iconColorChange = true : iconColorChange = false;
                      });
                    },
                    child: TextField(
                      cursorHeight: 22,
                      cursorWidth: 1.8,
                      cursorRadius: const Radius.circular(10),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 100,
                      controller: widget.controller,
                      textInputAction: TextInputAction.none,
                      cursorColor: Colors.black,
                      style: textstyle,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 30),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        isDense: true,
                        hintText: widget.hintText,
                        hintStyle: textstyleh,
                      ),
                      onChanged: (v) {
                        postController.page2chack();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ConditionBoxTemp extends StatefulWidget {
  final String title;
  final double topPadding;
  const ConditionBoxTemp({
    Key? key,
    required this.title,
    this.topPadding = 15.0,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ConditionBoxTempState createState() => _ConditionBoxTempState();
}

class _ConditionBoxTempState extends State<ConditionBoxTemp> {
  final PostController postController = Get.find();
  var textstyle = const TextStyle(
    overflow: TextOverflow.fade,
    // color: Colors.black,
    //! color: TextColors.maintextColor,
    height: 1.2,
    fontSize: 16,
    letterSpacing: 1.2,
  );
  var textstyleh = const TextStyle(
    overflow: TextOverflow.fade,
    height: 1.2,
    // color: Colors.black.withOpacity(0.40),
    //! color: TextColors.hinttextColor,
    fontSize: 15,
    letterSpacing: 1.2,
  );
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: widget.topPadding)),
            Text(
              widget.title,
              style: const TextStyle(
                //! color: TextColors.taitletextColor,
                letterSpacing: 0.7,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF2F3F5),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 48,
                    width: (Get.width / 3) + 30,
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          isExpanded: true,
                          icon: const Icon(Feather.chevron_down),
                          hint: Text(
                            postController.conditiontxt.value,
                            style: textstyleh,
                          ),
                          items: condition.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (val) {
                            postController.conditiontxt.value = val.toString();
                            postController.page2chack();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ConditionBox extends StatefulWidget {
  final String title;

  final double topPadding;
  const ConditionBox({Key? key, required this.title, this.topPadding = 15.0})
      : super(key: key);

  @override
  State<ConditionBox> createState() => _ConditionBoxState();
}

class _ConditionBoxState extends State<ConditionBox> {
  final PostController postController = Get.find();
  var textstyle = const TextStyle(
    overflow: TextOverflow.fade,
    // color: Colors.black,
    //! color: TextColors.maintextColor,
    height: 1.2,
    fontSize: 16,
    letterSpacing: 1.2,
  );
  var textstyleh = const TextStyle(
    overflow: TextOverflow.fade,
    height: 1.2,
    // color: Colors.black.withOpacity(0.40),
    //! color: TextColors.hinttextColor,
    fontSize: 15,
    letterSpacing: 1.2,
  );
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: widget.topPadding)),
            Text(
              widget.title,
              style: const TextStyle(
                //! color: TextColors.taitletextColor,
                letterSpacing: 0.7,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 48,
              width: Get.width / 2,
              decoration: BoxDecoration(
                color: const Color(0xffF2F3F5),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(6),
              ),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    isExpanded: true,
                    icon: const Icon(Feather.chevron_down),
                    hint: Text(
                      postController.conditiontxt.value,
                      style: textstyleh,
                    ),
                    items: condition.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value, style: textstyle),
                      );
                    }).toList(),
                    onChanged: (val) {
                      postController.conditiontxt.value = val.toString();
                      // postController.page2chack();
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
