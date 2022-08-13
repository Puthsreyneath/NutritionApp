import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_clone_1/constants.dart';

class CreateMealPlanCard extends StatelessWidget {
  const CreateMealPlanCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Column(
          children: <Widget>[
            Container(
              height: 175,
              width: size.width * 0.93,
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: size.width / 2,
                      child: Text(
                        "Create your meal plan",
                        style: TextStyle(
                          color: kQuaternaryColor,
                          fontFamily: fontfamily,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/image/header_meal.svg",
                      width: size.width * 0.4,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              height: 50,
              width: size.width * 0.93,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3),
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 10,
                )
              ]),
              child: Row(
                children: <Widget>[
                  Text(
                    "Create meal plan",
                    style: TextStyle(
                      fontFamily: fontfamily,
                      color: kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.add_circled),
                    color: kPrimaryColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
