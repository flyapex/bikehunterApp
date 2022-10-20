import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcons extends StatelessWidget {
  // final IconData icon;
  final String icon;
  final String title;
  final double iconsize;

  const SocialIcons({
    Key? key,
    required this.icon,
    required this.title,
    required this.iconsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 35,
            width: 35,
            color: Colors.transparent,
            // padding: const EdgeInsets.all(2),
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     width: 2,
            //     color: kPrimaryLightColor,
            //   ),
            //   shape: BoxShape.circle,
            // ),

            child: Center(
              child: SvgPicture.asset(
                icon,
                height: iconsize,
                width: iconsize,
              ),
            ),
            // child: Center(
            //   child: FaIcon(
            //     icon,
            //     color: Colors.white,
            //     size: 21,
            //   ),
            // ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              // fontWeight: FontWeight.w600,
              fontFamily: 'h3',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
