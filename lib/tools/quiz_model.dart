class QuizModel {
  String question;
  String answerA;
  String answerB;
  String answerD;
  String answerC;
  String correctAnswer;

  QuizModel(
      {required this.question,
      required this.answerA,
      required this.answerB,
      required this.answerD,
      required this.answerC,
      required this.correctAnswer});
}

class LessonModel {
  String lessonName;
  String lessonIcon;
  List<QuizModel> lessonList;
  LessonModel(
      {required this.lessonName,
      required this.lessonIcon,
      required this.lessonList});
}
