import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nodir_quiz/files/test_page.dart';

import '../tools/size_calculator.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    required this.photoName,
    required this.img,
    required this.index,
    this.onChange,
  });
  final String photoName;
  final String img;
  final int index;
  final void Function(Size size)? onChange;

  @override
  Widget build(BuildContext context) {
    return MeasureSize(
        onChange: onChange ?? (Size size) {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 47),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 13),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(157, 87, 227, 0.25),
                  blurRadius: 13,
                  spreadRadius: 4,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => TestPage(index: index)));
              },
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                children: [
                  const SizedBox(
                    width: 48,
                  ),
                  Image.asset(
                    img,
                    height: 90,
                    width: 90,
                  ),
                  SizedBox(
                      width: 173,
                      child: Center(
                          child: Text(
                        photoName,
                        style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5B1CAE)),
                      )))
                ],
              ),
            ),
          ),
        ));
  }
}
