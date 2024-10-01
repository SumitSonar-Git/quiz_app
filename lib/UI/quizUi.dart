import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/model/quesans_Model.dart';

class QuizUi extends StatefulWidget {
  const QuizUi({super.key});

  @override
  State<QuizUi> createState() => _QuizUiState();
}

class _QuizUiState extends State<QuizUi> {
  List<Questions> quesansList = getQuesAns();
  int score = 0;
  int currentQuesIndex = 0;
  Answers? selectedAnswer;
  bool isLastQuestion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Question container
                      IntrinsicHeight(
                        child: Container(
                          width: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xFF68AAFF),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Question ${currentQuesIndex + 1}/${getQuesAns().length}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  quesansList[currentQuesIndex].question_Text,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      // Answer buttons
                      Column(
                        children: quesansList[currentQuesIndex]
                            .answersList
                            .map(
                              (e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  width: double.infinity,
                                  height: 48,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      backgroundColor: e == selectedAnswer
                                          ? Colors.black
                                          : Color(0xFF82B8FF),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        selectedAnswer =
                                            e; // Set selected answer
                                      });
                                    },
                                    child: Text(
                                      e.answer_Text,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Next Button
              Container(
                width: 150,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Color(0xFF68AAFF),
                  ),
                  onPressed: () {
                    if (selectedAnswer == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('First select an answer'),
                          duration: Duration(seconds: 2), // SnackBar duration
                        ),
                      );
                      return; // Exit the function if no answer is selected
                    }

                    // Update score and show feedback message before moving to the next question
                    String feedbackMessage;
                    if (selectedAnswer!.iscorrect) {
                      score++;
                      feedbackMessage = 'Correct Answer!';
                    } else {
                      feedbackMessage = 'Incorrect Answer!';
                    }

                    // Show feedback using SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(feedbackMessage),
                        duration: Duration(seconds: 1), // SnackBar duration
                      ),
                    );

                    // Move to the next question or show completion dialog
                    setState(() {
                      if (currentQuesIndex < quesansList.length - 1) {
                        currentQuesIndex++;
                        selectedAnswer =
                            null; // Reset selected answer for the next question
                      } else {
                        // If it's the last question, show the completion dialog
                        isLastQuestion = true;
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Quiz Completed"),
                            content: Text(
                              "You Scored $score/${quesansList.length}",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    currentQuesIndex = 0;
                                    score = 0;
                                    isLastQuestion = false;
                                    selectedAnswer =
                                        null; // Reset selected answer
                                  });
                                },
                                child: Text("Restart"),
                              ),
                              TextButton(
                                onPressed: () {
                                  SystemNavigator.pop();
                                },
                                child: Text("Exit"),
                              ),
                            ],
                          ),
                        );
                      }
                    });
                  },
                  child: Text(
                    currentQuesIndex == quesansList.length - 1
                        ? 'Submit'
                        : "Next",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
