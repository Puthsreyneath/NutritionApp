import 'package:flutter/material.dart';
import 'package:test_clone_1/on-boarding-page/intro-screens/introOne.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final onBoardingScreenContent = IntroPageOne();
    return onBoardingScreenContent.OnboardingContent('assets/2.jpg',
        "To be number one, you have to train like you're number two. – Maurice Green");
  }
}
