import 'package:flutter/material.dart';
import 'package:test_clone_1/Recipes_part/constants.dart';
import 'package:test_clone_1/Recipes_part/data.dart';
import 'package:test_clone_1/Recipes_part/detail.dart';
import 'package:test_clone_1/Recipes_part/shared.dart';
import 'package:test_clone_1/meal-home-page/meal-home-page.dart';
import 'package:test_clone_1/pages/dairy_page.dart';
import 'package:test_clone_1/pages/exercise_page.dart';
import 'package:test_clone_1/profile_page/profile_page.dart';
import 'package:test_clone_1/profile_page/color_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../on-boarding-page/onboarding_screen.dart';
import '../profile_page/nav.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<bool> optionSelected = [true, true, true];
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  int _selectedIndex = 0;
  final List<Widget> _children = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      // drawer: Drawer(
      //   backgroundColor: Colors.green[200],
      //   child: profile_page(),
      // ),
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: Icon(Icons.person),
        //       color: Colors.black,
        //       onPressed: () => _key.currentState!.openDrawer(),
        //     );
        //   },
        // ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     color: Colors.black,
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextTitleVariation1('Nutrition'),
                  buildTextSubTitleVariation1('food recipes'),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      option('Vegetable', 'assets/icons/salad.png', 0),
                      SizedBox(
                        width: 8,
                      ),
                      option('Rice', 'assets/icons/rice.png', 1),
                      SizedBox(
                        width: 8,
                      ),
                      option('Fruit', 'assets/icons/fruit.png', 2),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  buildTextTitleVariation2('Popular', false),
                  SizedBox(
                    width: 8,
                  ),
                  buildTextTitleVariation2('Food', true),
                ],
              ),
            ),
            Container(
              height: 190,
              child: PageView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: buildPopulars(),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    bottom: 10,
                    top: 30,
                  ),
                  child: Container(
                    child: Text(
                      'Breakfast',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Fascinate',
                        color: Colors.grey[900],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //breakfast
            Container(
              height: 350,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildRecipesBreakfast(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            //lunch

            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    bottom: 10,
                  ),
                  child: Container(
                    child: Text(
                      'Lunch',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Fascinate',
                        color: Colors.grey[900],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 350,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildRecipesLunch(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // dinner
            // SizedBox(
            //   height: 20,
            // ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    bottom: 10,
                  ),
                  child: Container(
                    child: Text(
                      'Dinner',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Fascinate',
                        color: Colors.grey[900],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 350,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildRecipes(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottom(),
    );
  }

  Widget _buildBottom() {
    int seletedIndex = 0;

    return Container(
      color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          backgroundColor: Colors.greenAccent,
          color: Colors.black,
          activeColor: Colors.black,
          tabBackgroundColor: Colors.white,
          gap: 12,
          padding: EdgeInsets.all(16),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.food_bank_sharp,
              text: 'Recipes',
            ),
            GButton(
              icon: Icons.bar_chart,
              text: 'Dairy',
            ),
            GButton(
              icon: Icons.accessibility,
              text: ''
                  'Exercise',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(
              () {
                _selectedIndex = index;
                if (_selectedIndex == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MealHomePage()),
                  );
                }else if (_selectedIndex == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DairyPage()),
                  );
                }  else if (_selectedIndex == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExercisePage()),
                  );
                }  else if (_selectedIndex == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profile_page()),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget option(String text, String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          optionSelected[index] = !optionSelected[index];
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: optionSelected[index] ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Image.asset(
                image,
                color: optionSelected[index] ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: TextStyle(
                color: optionSelected[index] ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

//recipes building section
  List<Widget> buildRecipes() {
    List<Widget> list = [];
    for (var i = 0; i < getRecipes().length; i++) {
      list.add(buildRecipe(getRecipes()[i], i));
    }
    return list;
  }

//breakfast
  List<Widget> buildRecipesBreakfast() {
    List<Widget> list = [];
    for (var i = 0; i < getBreakfast().length; i++) {
      list.add(buildRecipe(getBreakfast()[i], i));
    }
    return list;
  }

//lunch
  List<Widget> buildRecipesLunch() {
    List<Widget> list = [];
    for (var i = 0; i < getLunch().length; i++) {
      list.add(buildRecipe(getLunch()[i], i));
    }
    return list;
  }

  Widget buildRecipe(Recipe recipe, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detail(recipe: recipe)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        margin: EdgeInsets.only(
            right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
        padding: EdgeInsets.all(16),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: recipe.image,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(recipe.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            buildRecipeTitle(recipe.title),
            buildTextSubTitleVariation2(recipe.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCalories(recipe.calories.toString() + " Kcal"),
                InkWell(
                  onTap: () {
                    setState(() {
                      _favorite = !_favorite;
                    });
                  },
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _favorite = !_favorite;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: _favorite ? Colors.red : Colors.grey[350],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // popular foods
  List<Widget> buildPopulars() {
    List<Widget> list = [];
    for (var i = 0; i < getRecipes().length; i += 1) {
      list.add(buildPopular(getRecipes()[i]));
    }
    return list;
  }

  Widget buildPopular(Recipe recipe) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [kBoxShadow],
      ),
      child: Row(
        children: [
          Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(recipe.image),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildRecipeTitle(recipe.title),
                  buildRecipeSubTitle(recipe.description),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCalories(recipe.calories.toString() + " Kcal"),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _favorite = !_favorite;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.favorite,
                              color:
                                  _favorite ? Colors.green : Colors.grey[350],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

bool _favorite = false;
