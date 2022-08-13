
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_clone_1/constants.dart';
import 'package:test_clone_1/meal-home-page/components/body.dart';

import '../Recipes_part/explore.dart';

class MealHomePage extends StatelessWidget {
  const MealHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BodyMealHomePage(),
      // bottomNavigationBar: Container(
      //   padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.8),
      //   height: 80,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         offset: Offset(0, -10),
      //         blurRadius: 35,
      //         color: kPrimaryColor.withOpacity(0.2),
      //       ),
      //     ],
      //   ),
      //   child: Row(
      //     children: <Widget>[
      //       IconButton(
      //         onPressed: () {},
      //         icon: SvgPicture.asset("assets/icons/bars_icon.svg"),
      //         iconSize: 60,
      //       ),
      //       Spacer(),
      //       IconButton(
      //         onPressed: () {},
      //         icon: SvgPicture.asset("assets/icons/cutlery_icon.svg"),
      //         iconSize: 40,
      //       ),
      //       Spacer(),
      //       IconButton(
      //         onPressed: () {},
      //         icon: SvgPicture.asset("assets/icons/food_and_drink.svg"),
      //         iconSize: 40,
      //       ),
      //       Spacer(),
      //       IconButton(
      //         onPressed: () {},
      //         icon: SvgPicture.asset("assets/icons/ball.svg"),
      //         iconSize: 40,
      //       ),
      //       Spacer(),
      //       IconButton(
      //         onPressed: () {},
      //         icon: SvgPicture.asset("assets/icons/profile.svg"),
      //         iconSize: 40,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kBackgroundColor,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              Explore()), (Route<dynamic> route) => false);
        },
        icon: Icon(
          Icons.arrow_back,
          color: kTextColor,
        ),
      ),
      title: Text(
        "Meals",
        style: TextStyle(
          fontFamily: 'ubuntu',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: kTextColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
          color: kTextColor,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_outline),
          color: kTextColor,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.workspace_premium_sharp,
            color: kQuinaryColor,
          ),
        ),
      ],
    );
  }
}
