import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_clone_1/constants.dart';
import 'package:test_clone_1/create-meal-plan-page/components/body.dart';
import 'package:test_clone_1/meal-home-page/meal-home-page.dart';

class CreateMealPlanPage extends StatelessWidget {
  const CreateMealPlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: CreateMealPageBody(),
      floatingActionButton: unlockPremiumBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  FloatingActionButton unlockPremiumBtn() {
    return FloatingActionButton.extended(
      onPressed: () {},
      backgroundColor: kPrimaryColor,
      label: Text(
        "Unlock Premium".toUpperCase(),
        style: TextStyle(
          fontFamily: fontfamily,
          fontSize: 16,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/crown_icon.svg",
          color: kPremiumBtnColor,
        ),
        iconSize: 16,
        onPressed: () {},
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kBackgroundColor,
      leading: IconButton(
        icon: Icon(
          CupertinoIcons.arrow_left,
          color: kTextColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "Create meal plan",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: kTextColor,
          fontFamily: fontfamily,
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.workspace_premium,
              color: kPremiumBtnColor,
            ))
      ],
    );
  }
}
