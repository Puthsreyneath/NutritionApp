import 'package:flutter/material.dart';
import 'package:test_clone_1/constants.dart';

class TextDetailContainer extends StatelessWidget {
  const TextDetailContainer({
    Key? key,
    required this.textDescription,
  }) : super(key: key);

  final String textDescription;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      width: size.width * 0.9,
      child: Text(
        "$textDescription",
        style: TextStyle(
          fontFamily: fontfamily,
          height: 1.4,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
