// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var _isVisible;
//   bool _showFab = true;

//   @override
//   Widget build(BuildContext context) {
//     const duration = Duration(milliseconds: 270);
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: AnimatedSlide(
//         duration: duration,
//         offset: _showFab ? Offset.zero : const Offset(0, 2),
//         child: AnimatedOpacity(
//           duration: duration,
//           opacity: _showFab ? 1 : 0,
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 20),
//             child: FloatingActionButton.extended(
//               tooltip: 'Post NOW',
//               label: Row(
//                 children: const [
//                   Icon(Icons.add),
//                   Text('Save'),
//                 ],
//               ),
//               onPressed: () {},
//             ),
//           ),
//         ),
//       ),
//       body: NotificationListener<ScrollNotification>(
//         onNotification: (notification) {
//           // final scrolltime = notification.metrics;
//           // final ScrollDirection direction = notification.direction;
//           // setState(() {
//           //   if (direction == ScrollDirection.reverse) {
//           //     _showFab = false;
//           //   } else if (direction == ScrollDirection.forward) {
//           //     _showFab = true;
//           //   }
//           // });
//           // return true;
//           setState(() {
//             if (notification is ScrollStartNotification) {
//               _showFab = false;
//             } else if (notification is ScrollUpdateNotification) {
//               print("Scroll Update");
//               _showFab = false;
//             } else if (notification is ScrollEndNotification) {
//               print("Scroll End");
//               _showFab = true;
//             }
//           });

//           return true;
//         },
//         child: ListView.builder(
//           itemCount: 100,
//           itemBuilder: (_, i) => ListTile(title: Text('$i')),
//         ),
//       ),
//     );
//   }
// }



//    // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       // // floatingActionButton: FloatingActionButton(
//       // //   onPressed: () {},
//       // //   child: Padding(
//       // //     padding: const EdgeInsets.all(8.0),
//       // //     child: Container(
//       // //       height: 60,
//       // //       width: 60,
//       // //       decoration: const BoxDecoration(
//       // //         shape: BoxShape.circle,
//       // //         gradient: LinearGradient(
//       // //           colors: [
//       // //             Colors.teal,
//       // //             Colors.greenAccent,
//       // //           ],
//       // //         ),
//       // //       ),
//       // //       child: const Icon(
//       // //         Icons.add,
//       // //         color: Colors.white,
//       // //       ),
//       // //     ),
//       // //   ),
//       // // ),
//       // floatingActionButton: Padding(
//       //   padding: const EdgeInsets.only(bottom: 20),
//       //   child: FloatingActionButton.extended(
//       //     tooltip: 'Post NOW',
//       //     label: Row(
//       //       children: const [
//       //         Icon(Icons.add),
//       //         Text('Save'),
//       //       ],
//       //     ),
//       //     onPressed: () {},
//       //   ),
//       // ),
//       // body: Container(
//       //   height: 100,
//       //   width: 100,
//       //   decoration: BoxDecoration(
//       //     color: Colors.red,
//       //     borderRadius: BorderRadius.circular(10),
//       //   ),
//       // ),