import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SortElement extends StatefulWidget {
  const SortElement({super.key});

  @override
  State<SortElement> createState() => _SortElementState();
}

class _SortElementState extends State<SortElement> {
  int _selectedIndex = 0;

  //for navigation bar
  changeDestination(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (opu) {},
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 100),
        height: Get.height / 1.3,
        width: Get.width,
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   colors: [Colors.blue, Colors.purpleAccent],
          // ),
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 4,
              width: 40,
              margin: const EdgeInsets.only(top: 5, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: changeDestination,
              selectedIconTheme: IconThemeData(color: Colors.black),
              unselectedIconTheme: IconThemeData(color: Colors.black),
              selectedLabelTextStyle: TextStyle(color: Colors.black),
              labelType: NavigationRailLabelType.selected,
              useIndicator: true,
              indicatorColor: Colors.yellow,
              destinations: const <NavigationRailDestination>[
                // navigation destinations
                NavigationRailDestination(
                  icon: Icon(Icons.attach_money_outlined),
                  selectedIcon: Icon(Icons.attach_money_rounded),
                  label: Text('By Budget'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.model_training),
                  selectedIcon: Icon(Icons.model_training_outlined),
                  label: Text('By Model'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.drive_eta_outlined),
                  selectedIcon: Icon(Icons.drive_eta_rounded),
                  label: Text('By KM driven'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.timer),
                  selectedIcon: Icon(Icons.timer_outlined),
                  label: Text('By Year'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
          ],
        ),
      ),
    );
  }
}
