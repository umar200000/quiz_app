import 'package:nodir_quiz/tools/imag_class.dart';
import 'package:nodir_quiz/tools/question_list.dart';
import 'package:nodir_quiz/tools/quiz_model.dart';

List<LessonModel> lessonList = [
  LessonModel(
    lessonIcon: Images100.englishImages,
    lessonList10: quizModelEnglish,
  ),
  LessonModel(
    lessonIcon: Images100.mathImages,
    lessonList10: quizModelMath,
  ),
  LessonModel(
    lessonIcon: Images100.dartImages,
    lessonList10: quizModelDart,
  ),
];
