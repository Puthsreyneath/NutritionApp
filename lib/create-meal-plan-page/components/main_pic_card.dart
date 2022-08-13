import 'package:flutter/material.dart';
import 'package:test_clone_1/constants.dart';

class MainPicCard extends StatelessWidget {
  const MainPicCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          // height: size.height * 0.3,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.3,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/food_01.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: size.width * 0.9,
                  height: 60,
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: kDefaultPadding),
                    child: Text(
                      "Create your meal plan",
                      style: TextStyle(
                        fontFamily: fontfamily,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kBackgroundColor,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
