import 'package:flutter/material.dart';
import 'package:test_clone_1/constants.dart';

class TextOption extends StatelessWidget {
  const TextOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: kTexColorGrey.withOpacity(0.2),
            width: 2,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MealOptionTextWithUnderline(title: "Meal Plans"),
          Spacer(),
          MealOptionText(title: "My plans"),
          Spacer(),
          MealOptionText(
            title: "Coach",
          ),
        ],
      ),
    );
  }
}

class MealOptionText extends StatelessWidget {
  const MealOptionText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: kDefaultPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "$title",
            style: TextStyle(
              fontFamily: 'ubuntu',
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: kTexColorGrey,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

class MealOptionTextWithUnderline extends StatelessWidget {
  const MealOptionTextWithUnderline({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: kDefaultPadding,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$title",
            style: TextStyle(
              fontFamily: 'ubuntu',
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: kPrimaryColor,
            ),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 5,
            ),
            child: Container(
              height: 5,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: kPrimaryColor,
              ),
              alignment: Alignment.topLeft,
            ),
          ),
        ],
      ),
    );
  }
}
