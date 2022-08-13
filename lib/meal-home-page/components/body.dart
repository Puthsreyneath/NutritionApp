import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_clone_1/constants.dart';
import 'package:test_clone_1/meal-home-page/components/create_meal_plan_card.dart';
import 'package:test_clone_1/meal-home-page/components/row_of_food_card.dart';
import 'package:test_clone_1/meal-home-page/components/text-option.dart';
import 'package:test_clone_1/meal-home-page/components/title_with_viewmorebtn.dart';

class BodyMealHomePage extends StatelessWidget {
  const BodyMealHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          TextOption(),
          CreateMealPlanCard(),
          TitleWithViewMore(
            title: "Immunity Booster",
          ),
          RowOfFoodCard(),
          TitleWithViewMore(
            title: "Weight loss",
          ),
          RowOfFoodCard(),
          SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}
