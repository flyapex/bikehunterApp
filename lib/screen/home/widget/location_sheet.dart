import 'package:bikehunter/constants/colors.dart';
import 'package:bikehunter/controller/db_controller.dart';
import 'package:bikehunter/controller/location_controller.dart';
import 'package:bikehunter/controller/navigation_controller.dart';
import 'package:bikehunter/model/catagory_model.dart';
import 'package:bikehunter/model/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationAppbarBottomSheet extends StatelessWidget {
  LocationAppbarBottomSheet({Key? key}) : super(key: key);
  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(23.777176, 90.399452), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    final NavbarController navbarController = Get.find();
    final LocationController locationController = Get.find();
    final DBController dbController = Get.find();

    return AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 250),
        height: Get.height - 100,
        width: Get.width,
        padding: const EdgeInsets.only(left: 25, right: 25),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          // floatingActionButton: Padding(
          //   padding: const EdgeInsets.only(bottom: 20),
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.black,
          //     onPressed: () async {
          //       Navigator.pop(context);
          //       navbarController.selectedIndex = 1;
          //       //updating locaiton to server
          //       locationController.setLocation(
          //         LocationUpdateModel(
          //           uid: dbController.isLogin(),
          //           division: locationController.alldivitiontxt.value,
          //           city: locationController.subdivitiontxt.value,
          //         ),
          //       );
          //     },
          //     // child: const Icon(
          //     //   Feather.search,
          //     //   color: Colors.white,
          //     // ),
          //   ),
          // ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 4,
                  width: 40,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const CatagoryBox(
                title: "District",
                title2: "City",
                topPadding: 10.0,
              ),
              const SizedBox(height: 40),
              Text(
                "Get Current Location",
                style: TextStyle(color: kTEXT2),
              ),
              const SizedBox(height: 15),
              Container(
                height: 270,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: GoogleMap(
                        initialCameraPosition: initialCameraPosition,
                        zoomControlsEnabled: false,
                        mapType: MapType.normal,
                        onMapCreated: (GoogleMapController controller) {
                          googleMapController = controller;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          backgroundColor: Colors.blue,
                          onPressed: () {
                            //hello world
                            //GG
                          },
                          child: const Icon(
                            Feather.map_pin,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class CatagoryBox extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title;
  // ignore: prefer_typing_uninitialized_variables
  final title2;
  final double topPadding;
  const CatagoryBox({Key? key, this.title, this.topPadding = 10, this.title2})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CatagoryBoxState createState() => _CatagoryBoxState();
}

class _CatagoryBoxState extends State<CatagoryBox> {
  LocationController locationController = Get.put(LocationController());

  final DBController dbController = Get.find();

  @override
  void initState() {
    super.initState();
  }

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
                  color: Color(0xff7B7B7B),
                  letterSpacing: 0.7,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xffF2F3F5),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      isExpanded: true,
                      icon: const Icon(Feather.chevron_down),
                      hint: Text(locationController.alldivitiontxt.value),
                      items: alldivition.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val) async {
                        locationController.alldivitiontxt.value =
                            val.toString();
                        locationController.catagoryChack();

                        dbController.saveUserdis(val.toString());
                        // var responseLocation =
                        //     await locationController.locationUpdateApi(
                        //   signUpController.uid.value,
                        //   val,
                        // );
                        // databaseController.updatelocation(responseLocation);
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
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      itemHeight: 50,
                      isExpanded: true,
                      icon: const Icon(Feather.chevron_down),
                      hint: Text(locationController.subdivitiontxt.value),
                      items: locationController.subdivitionlist
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val) async {
                        locationController.subdivitiontxt.value =
                            val.toString();
                        dbController.saveUsercity(val.toString());

                        // var responseLocation =
                        //     await locationController.locationUpdateApi(
                        //   signUpController.uid.value,
                        //   val,
                        // );
                        // databaseController.updatelocation(responseLocation);
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
