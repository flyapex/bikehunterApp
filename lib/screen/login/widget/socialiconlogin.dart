import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIconsLogin extends StatelessWidget {
  final String icon;
  final String title;
  final double iconsize;
  final Color iconColor;

  const SocialIconsLogin({
    Key? key,
    required this.icon,
    required this.title,
    required this.iconsize,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          width: 1,
          color: const Color(0xFF4E2E9E),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 35,
            width: 35,
            padding: const EdgeInsets.all(2),
            child: Center(
              child: iconColor == Colors.red
                  ? SvgPicture.asset(
                      icon,
                      height: iconsize,
                      width: iconsize,
                    )
                  : SvgPicture.asset(
                      icon,
                      height: iconsize,
                      width: iconsize,
                      color: iconColor,
                    ),
            ),
          ),
          const SizedBox(width: 17),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'h3',
                color: Color(0xFF4E2E9E),
                fontSize: 18,
                height: 1.5,
                letterSpacing: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
