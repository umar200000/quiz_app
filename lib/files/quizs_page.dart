import 'package:flutter/material.dart';
import 'package:nodir_quiz/additional_widgets/quiz_button.dart';
import 'package:nodir_quiz/tools/imag_class.dart';

class QuizsPage extends StatefulWidget {
  const QuizsPage({super.key});

  @override
  State<QuizsPage> createState() => _QuizsPageState();
}

class _QuizsPageState extends State<QuizsPage> {
  Size? containerSize;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              Images100.mainImg,
              alignment: Alignment.topCenter,
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / (411 / 445)) -
                  ((containerSize != null ? containerSize!.height : 0) - 41),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QuizButton(
                    photoName: "English",
                    img: Images100.englishImg,
                    index: 0,
                    onChange: (Size size) {
                      setState(() {
                        containerSize = size;
                      });
                    },
                  ),
                  QuizButton(
                    photoName: "Math",
                    img: Images100.mathImg,
                    index: 1,
                  ),
                  QuizButton(
                    photoName: "Dart",
                    img: Images100.dartImg,
                    index: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
