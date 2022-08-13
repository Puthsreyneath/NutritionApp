import 'package:flutter/material.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingContent('assets/1.jpg',
        "Your fitness is 100% mental. Your body won’t go where your mind doesn‘t push it.");
  }

  Widget OnboardingContent(var imagePath, var text) {
    return Container(
      color: const Color(0xFF51A474),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 350,
              height: 300,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 16),
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFFFFFF),
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
