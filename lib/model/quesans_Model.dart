class Questions {
  final String question_Text;
  final List<Answers> answersList;

  Questions({required this.question_Text, required this.answersList});
}

class Answers {
  final String answer_Text;
  final bool iscorrect;

  Answers({required this.answer_Text, required this.iscorrect});
}

List<Questions> getQuesAns() {
  List<Questions> list = [];

  list.add(
    Questions(
      question_Text: "What is Flutter?",
      answersList: [
        Answers(
            answer_Text: "A mobile development framework by Apple",
            iscorrect: false),
        Answers(
            answer_Text: "A mobile development framework by Google",
            iscorrect: true),
        Answers(answer_Text: "A game development platform", iscorrect: false),
        Answers(answer_Text: "A web development framework", iscorrect: false),
      ],
    ),
  );

  list.add(
    Questions(
      question_Text: "Which language is used to write Flutter apps?",
      answersList: [
        Answers(answer_Text: "Java", iscorrect: false),
        Answers(answer_Text: "Swift", iscorrect: false),
        Answers(answer_Text: "Dart", iscorrect: true),
        Answers(answer_Text: "Kotlin", iscorrect: false),
      ],
    ),
  );

  list.add(
    Questions(
      question_Text: "What is a widget in Flutter?",
      answersList: [
        Answers(answer_Text: "A blueprint of a class", iscorrect: false),
        Answers(
            answer_Text: "A component used to build the UI", iscorrect: true),
        Answers(
            answer_Text: "A function to handle API calls", iscorrect: false),
        Answers(
            answer_Text: "A tool to test Flutter applications",
            iscorrect: false),
      ],
    ),
  );

  list.add(
    Questions(
      question_Text: "What is `setState()` in Flutter?",
      answersList: [
        Answers(answer_Text: "A method to update the UI", iscorrect: true),
        Answers(answer_Text: "A function to make API calls", iscorrect: false),
        Answers(answer_Text: "A method to create navigation", iscorrect: false),
        Answers(
            answer_Text: "A function to fetch data from the database",
            iscorrect: false),
      ],
    ),
  );

  list.add(
    Questions(
      question_Text: "Which of these is the Flutter state management solution?",
      answersList: [
        Answers(answer_Text: "Redux", iscorrect: true),
        Answers(answer_Text: "Retrofit", iscorrect: false),
        Answers(answer_Text: "React", iscorrect: false),
        Answers(answer_Text: "Firestore", iscorrect: false),
      ],
    ),
  );

  list.add(
    Questions(
      question_Text: "What is a `StatelessWidget` in Flutter?",
      answersList: [
        Answers(answer_Text: "A widget with no state", iscorrect: true),
        Answers(
            answer_Text: "A widget that can change its state",
            iscorrect: false),
        Answers(answer_Text: "A widget used for animations", iscorrect: false),
        Answers(
            answer_Text: "A widget to handle API requests", iscorrect: false),
      ],
    ),
  );

  list.add(
    Questions(
      question_Text:
          "Which of the following is a core component of a Flutter app?",
      answersList: [
        Answers(answer_Text: "Activity", iscorrect: false),
        Answers(answer_Text: "View", iscorrect: false),
        Answers(answer_Text: "Widget", iscorrect: true),
        Answers(answer_Text: "Fragment", iscorrect: false),
      ],
    ),
  );

  list.add(
    Questions(
      question_Text: "Which company maintains Flutter?",
      answersList: [
        Answers(answer_Text: "Apple", iscorrect: false),
        Answers(answer_Text: "Google", iscorrect: true),
        Answers(answer_Text: "Microsoft", iscorrect: false),
        Answers(answer_Text: "Facebook", iscorrect: false),
      ],
    ),
  );

  list.add(
    Questions(
      question_Text: "Which of these is a package manager for Flutter?",
      answersList: [
        Answers(answer_Text: "Gradle", iscorrect: false),
        Answers(answer_Text: "CocoaPods", iscorrect: false),
        Answers(answer_Text: "pub.dev", iscorrect: true),
        Answers(answer_Text: "Node.js", iscorrect: false),
      ],
    ),
  );

  list.add(
    Questions(
      question_Text: "What is the build method in Flutter?",
      answersList: [
        Answers(
            answer_Text: "A function that builds the UI of a widget",
            iscorrect: true),
        Answers(
            answer_Text: "A function to perform background tasks",
            iscorrect: false),
        Answers(answer_Text: "A method to call APIs", iscorrect: false),
        Answers(
            answer_Text: "A method for database operations", iscorrect: false),
      ],
    ),
  );

  return list;
}
