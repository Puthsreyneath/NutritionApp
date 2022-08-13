import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_clone_1/constants.dart';
import 'package:test_clone_1/create-meal-plan-page/components/about_title.dart';
import 'package:test_clone_1/create-meal-plan-page/components/main_pic_card.dart';
import 'package:test_clone_1/create-meal-plan-page/components/text_description.dart';

class CreateMealPageBody extends StatelessWidget {
  const CreateMealPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainPicCard(),
          AboutTitle(),
          TextDetailContainer(
            textDescription:
                "An ingredient is a substance that forms part of a mixture (in a general sense). For example, in cooking, cipes specify which ingredients are used to prepare a specific dish. Many commercial products contain secret ingredients that are purported to make them better than competing products. In the pharmaceutical industry, an active ingredient is that part of a formulation that yields the effect expected by the customer.",
          ),
        ],
      ),
    );
  }
}
