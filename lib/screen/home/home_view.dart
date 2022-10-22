import 'package:bikehunter/constants/colors.dart';
import 'package:bikehunter/controller/db_controller.dart';
import 'package:bikehunter/controller/post_controller.dart';
import 'package:bikehunter/screen/home/widget/app_bar.dart';
import 'package:bikehunter/screen/home/widget/banner_ads.dart';
import 'package:bikehunter/screen/post_now/new_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/login_sheet.dart';
import 'widget/post_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool _showFab = true;
  final PostController postController = Get.put(PostController());
  final DBController dbController = Get.find();

  @override
  void initState() {
    postController.getAllPost();
    final scrollController = postController.scrollController;
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
          // print("You're at the top.");
        } else {
          // print("You're at the bottom.");
          _showFab = false;
          postController.getAllPost();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    const duration = Duration(milliseconds: 270);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        drawer: const Drawer(),
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: AnimatedSlide(
          duration: duration,
          offset: _showFab ? Offset.zero : const Offset(0, 2),
          child: AnimatedOpacity(
            duration: duration,
            opacity: _showFab ? 1 : 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FloatingActionButton.extended(
                tooltip: 'Post NOW',
                label: Row(
                  children: const [
                    Icon(Icons.add),
                    Text('Save'),
                  ],
                ),
                onPressed: () {
                  print(dbController.isLogin());
                  if (dbController.isLogin() == 0) {
                    Get.bottomSheet(
                      const LoginSheet(),
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
                  } else {
                    Get.bottomSheet(
                      const NewPostPage(),
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
                  }
                },
              ),
            ),
          ),
        ),
        body: NotificationListener(
          onNotification: (scrollNotification) {
            // if (scrollNotification is ScrollUpdateNotification) {
            //   setState(() {
            //     _showFab = false;
            //   });
            // } else {
            //   setState(() {
            //     _showFab = true;
            //   });
            // }
            return true;
          },
          // onNotification: (notification) {
          // setState(() {
          //   if (notification is ScrollStartNotification) {
          //     print("Scroll Start");
          //     _showFab = false;
          //   } else if (notification is ScrollUpdateNotification) {
          //     print("Scroll Update");
          //     _showFab = false;
          //   } else if (notification is ScrollEndNotification) {
          //     print("Scroll End");
          //     _showFab = true;
          //   }
          //   // });
          //   if (postController.scrollController.position.pixels ==
          //       postController.scrollController.position.maxScrollExtent) {
          //     print("Scroll Start");
          //     _showFab = false;
          //   }
          //   return true;
          // },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomScrollView(
                controller: postController.scrollController,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
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
                        ImageSlide(
                          topPadding: 10.0,
                          hight: 180,
                        ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 20),
                  ),
                  // SliverToBoxAdapter(
                  //   child: GridView.builder(
                  //     // physics: const AlwaysScrollableScrollPhysics(
                  //     //     parent: BouncingScrollPhysics()),
                  //     // physics: FixedExtentScrollPhysics(),
                  //     // controller: postController.scrollController,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     shrinkWrap: true,
                  //     gridDelegate:
                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2,
                  //       crossAxisSpacing: 20,
                  //       mainAxisSpacing: 20,
                  //       childAspectRatio: 0.65,
                  //     ),
                  //     // itemCount: snapshot.data.length + 1,
                  //     itemCount: 200,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Container(
                  //         height: 100,
                  //         width: 100,
                  //         color: Colors.red,
                  //         child: Center(child: Text("$index")),
                  //       );
                  //     },
                  //   ),
                  // ),
                  StreamBuilder(
                    stream: postController.allpostList.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return SliverToBoxAdapter(
                          child: GridView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 0.65,
                            ),
                            itemCount: snapshot.data.length + 1,
                            itemBuilder: (BuildContext context, int index) {
                              if (index < snapshot.data.length) {
                                // return Container(
                                //   height: 100,
                                //   width: 100,
                                //   color: Colors.red,
                                //   child: Center(child: Text("$index")),
                                // );
                                return Post(
                                  postData: snapshot.data[index],
                                  snapshot: snapshot,
                                  currentINDEX: index,
                                );
                              } else {
                                if (postController.allpostLoding.value) {
                                  return const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                } else {
                                  return const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text('nothing more to load!'),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        // body: NotificationListener<ScrollNotification>(
        //   onNotification: (notification) {
        //     setState(() {
        //       if (notification is ScrollStartNotification) {
        //         print("Scroll Start");
        //         _showFab = false;
        //       } else if (notification is ScrollUpdateNotification) {
        //         print("Scroll Update");
        //         _showFab = false;
        //       } else if (notification is ScrollEndNotification) {
        //         print("Scroll End");
        //         _showFab = true;
        //       }
        //     });
        //     return true;
        //   },
        //   // child: ListView.builder(
        //   //   itemCount: 100,
        //   //   itemBuilder: (_, i) => ListTile(title: Text('$i')),
        //   // ),
        //   child:
        // ),
      ),
    );
  }
}
