import 'package:bikehunter/constants/colors.dart';
import 'package:bikehunter/controller/db_controller.dart';
import 'package:bikehunter/controller/post_controller.dart';
import 'package:bikehunter/screen/home/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'widget/banner_ads.dart';
import 'widget/post_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final PostController postController = Get.put(PostController());
  final DBController dbController = Get.put(DBController());

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
          postController.getAllPost();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          dbController.saveUserId(0);
          // Get.offAll(() => const SLHome());
        },
        child: const Icon(
          Feather.log_out,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
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
    );
  }
}
