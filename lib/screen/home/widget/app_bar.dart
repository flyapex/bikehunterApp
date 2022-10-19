import 'package:bikehunter/constants/colors.dart';
import 'package:bikehunter/controller/db_controller.dart';
import 'package:bikehunter/controller/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import 'appbar_textfield/user_data.dart';
import 'location_sheet.dart';

class CustomeAppBar extends StatefulWidget {
  const CustomeAppBar({Key? key}) : super(key: key);

  @override
  State<CustomeAppBar> createState() => _CustomeAppBarState();
}

class _CustomeAppBarState extends State<CustomeAppBar> {
  LocationController locationController = Get.put(LocationController());
  DBController dbController = Get.find();

  getLocation() async {
    await locationController.getLocation(dbController.isLogin());
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      floating: true,
      pinned: true,
      snap: false,
      titleSpacing: 0,
      title: Row(
        children: [
          SizedBox(
            height: 37,
            child: SvgPicture.asset(
              'assets/icons/home/logo.svg',
              color: const Color(0xff121729),
            ),
          ),
        ],
      ),
      actions: [
        Obx(
          () {
            return ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      children: [
                        Text(
                          '${locationController.subdivitiontxt}',
                          style: TextStyle(
                            color: const Color(0xff1A3259).withOpacity(0.8),
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dotted,
                          ),
                        ),
                        Icon(
                          Icons.place_outlined,
                          color: Colors.black.withOpacity(0.5),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.bottomSheet(
                      const LocationAppbarBottomSheet(),
                      elevation: 20.0,
                      enableDrag: true,
                      backgroundColor: Colors.white,
                      isScrollControlled: true,
                      ignoreSafeArea: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      enterBottomSheetDuration:
                          const Duration(milliseconds: 170),
                    );
                  },
                ),
              ),
            );
          },
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(right: 5),
            child: SvgPicture.asset(
              'assets/icons/home/align.svg',
              color: Colors.black.withOpacity(0.5),
              height: 24,
              width: 24,
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        IconButton(
                          splashRadius: 24,
                          onPressed: () {},
                          icon: Icon(
                            Feather.search,
                            color: kTEXT2,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: TypeAheadFormField<User?>(
                              suggestionsCallback: UserApi.getUserSuggestions,
                              itemBuilder: (context, User? suggestion) {
                                final user = suggestion!;
                                return ListTile(
                                  title: Text(user.name),
                                );
                              },
                              onSuggestionSelected: (User? suggestion) {
                                print(suggestion!.name);
                              },
                              suggestionsBoxDecoration:
                                  const SuggestionsBoxDecoration(
                                      elevation: 10.0),
                            ),
                            // child: TextField(
                            //   focusNode: FocusNode(),
                            //   textAlign: TextAlign.justify,
                            //   cursorColor: Colors.black,
                            //   style: TextStyle(
                            //     color: Colors.black.withOpacity(0.40),
                            //     fontSize: 14,
                            //     letterSpacing: 1.2,
                            //   ),
                            //   decoration: const InputDecoration(
                            //     border: OutlineInputBorder(
                            //       borderSide: BorderSide.none,
                            //     ),
                            //     isDense: true,
                            //     hintText: 'Motorcycle in Dhaka',
                            //   ),
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
