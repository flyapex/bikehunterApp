import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class UsedPage extends StatefulWidget {
  const UsedPage({Key? key}) : super(key: key);

  @override
  State<UsedPage> createState() => _UsedPageState();
}

class _UsedPageState extends State<UsedPage> {
  @override
  Widget build(BuildContext context) {
    String tklimit(index) {
      return '$index-${(index + 1)} Lakh';
    }
    // String tklimit(index) {
    //   if (index == 0) {
    //     return '0-${(index + 1) * 50} K';
    //   } else if (index == 1) {
    //     return '${index * 50}k-${(index)} Lakh';
    //   } else {
    //     // return '${index * 50}-${(index + 1) * 50}K';
    //     return '$index-${(index + 1)} Lakh';
    //   }
    // }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          IconButton(
                            splashRadius: 24,
                            splashColor: Colors.white,
                            onPressed: () {},
                            icon: Icon(
                              Feather.search,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: TextField(
                                focusNode: FocusNode(),
                                textAlign: TextAlign.justify,
                                cursorColor: Colors.black,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.40),
                                  fontSize: 14,
                                  letterSpacing: 1.2,
                                ),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  isDense: true,
                                  hintText: 'Search for used bike',
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            splashRadius: 24,
                            splashColor: Colors.white,
                            // splashColor: const Color(0xff121729),
                            onPressed: () {},
                            icon: Icon(
                              Icons.mic_none,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          // const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                  // IconButton(
                  //   splashRadius: 24,
                  //   splashColor: const Color(0xff121729),
                  //   onPressed: () {},
                  //   icon: Icon(
                  //     Icons.settings,
                  //     color: Colors.black.withOpacity(0.5),
                  //   ),
                  // ),

                  IconButton(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    constraints: const BoxConstraints(),
                    splashRadius: 24,
                    splashColor: Colors.white,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/home/slider.svg',
                      height: 23,
                      width: 23,
                      // color: const Color(0xff133E44),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    //  icon: RotationTransition(
                    //   turns: const AlwaysStoppedAnimation(90 / 360),
                    //   child: SvgPicture.asset(
                    //     'assets/icons/home/slider.svg',
                    //     height: 23,
                    //     width: 23,
                    //     // color: const Color(0xff133E44),
                    //     color: Colors.black.withOpacity(0.5),
                    //   ),
                    // ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Sort by",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    fontFamily: 'h2',
                  ),
                ),
              ),
              Container(
                height: 40,
                color: Colors.white,
                child: ListView.builder(
                  //*---------------------loading post
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),

                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: PriceChipes(
                        label: tklimit(index),
                        // label: '${index * 50}-${(index + 1) * 50}K',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PriceChipes extends StatefulWidget {
  final String label;
  const PriceChipes({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<PriceChipes> createState() => _PriceChipesState();
}

class _PriceChipesState extends State<PriceChipes> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      padding: const EdgeInsets.only(left: 10, right: 10),
      backgroundColor: Colors.white,
      elevation: 1,
      shadowColor: Colors.white,
      selectedShadowColor: Colors.black,
      // backgroundColor: TextColors.hinttextColor,
      // avatar: CircleAvatar(
      //   backgroundColor: Colors.cyan,
      //   child: Text(
      //     company.name[0].toUpperCase(),
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      showCheckmark: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(
          color: Colors.blueAccent,
        ),
      ),
      label: Text(
        widget.label,
        style: TextStyle(
          fontFamily: isSelected ? 'h3' : 'h1',
          fontSize: isSelected ? 14 : 13,
          color: Colors.blueAccent,
          letterSpacing: 1,
        ),
      ),
      selected: isSelected,

      selectedColor: Colors.white,

      onSelected: (bool selected) {
        setState(() {
          // if (selected) {
          //   // _filters.add(company.name);

          // } else {
          //   _filters.removeWhere((String name) {
          //     return name == company.name;
          //   });
          // }
          isSelected = selected;
        });
      },
    );
  }
}
