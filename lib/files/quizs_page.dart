import 'package:flutter/material.dart';
import 'package:nodir_quiz/tools/imag_class.dart';

import '../tools/size_calculator.dart';

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
                  makeContaner(
                    "English",
                    Images100.englishImg,
                    onChange: (Size size) {
                      setState(() {
                        containerSize = size;
                      });
                    },
                  ),
                  makeContaner("Math", Images100.mathImg),
                  makeContaner("Dart", Images100.englishImg),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget makeContaner(String phontName, String img,
    {void Function(Size size)? onChange}) {
  return MeasureSize(
      onChange: onChange ?? (Size size) {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 47),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 13),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(157, 87, 227, 0.25),
                blurRadius: 13,
                spreadRadius: 4,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: MaterialButton(
            onPressed: () {},
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Row(
              children: [
                SizedBox(
                  width: 48,
                ),
                Image.asset(
                  img,
                  height: 90,
                  width: 90,
                ),
                Container(
                    width: 173,
                    child: Center(
                        child: Text(
                      phontName,
                      style: TextStyle(
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
