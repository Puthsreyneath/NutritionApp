import 'package:flutter/material.dart';
import 'package:test_clone_1/constants.dart';

class AboutTitle extends StatelessWidget {
  const AboutTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: kDefaultPadding * 0.6,
        horizontal: kDefaultPadding,
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        "About",
        style: TextStyle(
          fontFamily: fontfamily,
          fontSize: 19,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
