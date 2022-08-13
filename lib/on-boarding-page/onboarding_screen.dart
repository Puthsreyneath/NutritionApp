import 'package:flutter/material.dart';
import 'package:test_clone_1/meal-home-page/meal-home-page.dart';
import 'package:test_clone_1/on-boarding-page/intro-screens/introOne.dart';
import 'package:test_clone_1/on-boarding-page/intro-screens/introThree.dart';
import 'package:test_clone_1/on-boarding-page/intro-screens/introTwo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnBoardingScreen> {
  //controller which track what page we are on
  PageController _controller = PageController();
  bool lastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              lastPage = (index == 2);
            },
            children: [
              IntroPageOne(),
              IntroPageTwo(),
              IntroPageThree(),
            ],
          ),
          //dot indicator
          Container(
            alignment: Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text("Skip"),
                ),
                SmoothPageIndicator(controller: _controller, count: 3),
                lastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MealHomePage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Done",
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text("Next"),
                      )
                //next
              ],
            ),
          ),
        ],
      ),
    );
  }
}
