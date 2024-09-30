import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/UI/homeUi.dart';

class splashScreen extends StatelessWidget {
  splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: SizedBox(
              width: 200, // You can adjust the width and height as needed
              height: 200,
              child: LottieBuilder.asset(
                "assets/Lottie/Animation - 1727360056943.json",
              ),
            ),
          )
        ],
      ),
      nextScreen: homeUi(),
      splashIconSize: 200,
      backgroundColor: Color(0xFF68AAFF),
    );
  }
}
