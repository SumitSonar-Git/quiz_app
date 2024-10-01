import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/UI/quizUi.dart';

class homeUi extends StatefulWidget {
  const homeUi({super.key});

  @override
  State<homeUi> createState() => _homeUiState();
}

class _homeUiState extends State<homeUi> {
  // Initial position of the button
  double _position = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(milliseconds: 800), (timer) {
      setState(() {
        _position = _position == 0.0 ? 10.0 : 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF68AAFF),
        appBar: AppBar(
          title: Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Irish Grover',
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Quiz",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                          offset:
                              Offset(2.0, 2.0), // Position of the shadow (x, y)
                          blurRadius: 3.0, // How blurry the shadow is
                          color: Colors.black
                              .withOpacity(0.2), // Shadow color with opacity
                        ),
                      ],
                      fontSize: 70,
                      color: Colors.black,
                      fontFamily: 'Irish Grover',
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Image.asset("assets/Images/quizImage.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Play To Gain Your \n Knowledge",
                        style: TextStyle(
                            shadows: [
                              Shadow(
                                offset: Offset(
                                    2.0, 2.0), // Position of the shadow (x, y)
                                blurRadius: 3.0, // How blurry the shadow is
                                color: Colors.black.withOpacity(
                                    0.2), // Shadow color with opacity
                              ),
                            ],
                            fontSize: 25,
                            color: Colors.black,
                            fontFamily: 'Irish Grover',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  transform: Matrix4.translationValues(0, _position, 0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text('Loading....'),
                        //     duration: Duration(seconds: 2), // SnackBar duration
                        //   ),

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => QuizUi(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                offset: Offset(
                                    2.0, 2.0), // Position of the shadow (x, y)
                                blurRadius: 2.0, // How blurry the shadow is
                                color: Colors.black.withOpacity(
                                    0.1), // Shadow color with opacity
                              ),
                            ],
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: 'Irish Grover',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
