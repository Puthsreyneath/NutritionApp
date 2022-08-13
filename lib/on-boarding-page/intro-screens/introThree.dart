import 'package:flutter/material.dart';
import 'package:test_clone_1/on-boarding-page/intro-screens/introOne.dart';

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IntroOne = IntroPageOne();
    return IntroOne.OnboardingContent("assets/3.jpg",
        "“Wake up with determination, go to bed with satisfaction.” ");
  }
}
