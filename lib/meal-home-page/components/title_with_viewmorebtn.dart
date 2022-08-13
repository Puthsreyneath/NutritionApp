import 'package:flutter/material.dart';
import 'package:test_clone_1/constants.dart';

class TitleWithViewMore extends StatelessWidget {
  const TitleWithViewMore({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.8,
        vertical: kDefaultPadding * 0.5,
      ),
      child: Row(
        children: <Widget>[
          Text(
            "$title",
            style: TextStyle(
              fontFamily: fontfamily,
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: kTextColor,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Text(
              "View more",
              style: TextStyle(
                fontFamily: fontfamily,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
