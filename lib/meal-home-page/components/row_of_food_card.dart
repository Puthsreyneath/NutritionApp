import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_clone_1/constants.dart';
import 'package:test_clone_1/create-meal-plan-page/create_meal_plan_page.dart';
import 'package:test_clone_1/meal-home-page/model/RandomFood.dart';
import 'package:http/http.dart' as http;

class RowOfFoodCard extends StatelessWidget {
  const RowOfFoodCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getFoodData() async {
      var response = await http.get(Uri.parse(
          'https://api.spoonacular.com/recipes/random?number=10&apiKey=e00ab1dbf4bb48ba8964a52e537d38bc'));
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<dynamic> recipes = jsonData["recipes"];
      List<RandomFood> foods = [];
      for (int i = 0; i < recipes.length; i++) {
        RandomFood food = RandomFood(
            recipes[i]['title'],
            recipes[i]['healthScore'],
            recipes[i]['image'],
            recipes[i]['summary']);
        foods.add(food);
      }

      return foods;
    }

    return FutureBuilder<List<RandomFood>>(
      future: getFoodData(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError)
          return Text(snapshot.error.toString());
        else
          return _buildRow(snapshot.data, context);
      },
    );
  }

  Widget _buildRow(List<RandomFood>? foods, BuildContext context) {
    if (foods == null) return Icon(Icons.error);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.8,
          vertical: kDefaultPadding * 0.5,
        ),
        child: Row(
          children: [
            for (var data in foods)
              FoodCard(
                foodName: "${data.title}",
                foodCal: "${data.healthScore}",
                img: "${data.image}",
              ),
          ],
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard(
      {Key? key,
      required this.foodName,
      required this.foodCal,
      required this.img})
      : super(key: key);
  final String foodName, img;
  final String foodCal;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(right: kDefaultPadding * 0.5),
      height: heightSmallCard,
      width: size.width * 0.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 10,
            )
          ]),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateMealPlanPage(),
                ),
              );
            },
            child: Container(
              height: heightSmallCard / 2,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage("${img}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 0.5,
            ),
            child: Container(
              child: Text(
                "$foodName",
                // "Baked Parmesan Zucchini Chips"
                style: TextStyle(
                  fontFamily: fontfamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: Row(
              children: <Widget>[
                Text(
                  "$foodCal Cal",
                  style: TextStyle(
                    fontFamily: fontfamily,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.heart),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
