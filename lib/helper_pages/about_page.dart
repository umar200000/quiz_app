import 'package:flutter/material.dart';
import 'package:nodir_quiz/tools/imag_class.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Image.asset(
                Images100.splashImg,
                fit: BoxFit.fill,
              ),
            ),
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "About Game",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.red),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Text(
                    "This Quiz game is made by Umarjon Ruziev in 2024/01/21"
                    " this game is so interesting and useful if you play it you will definitely learn a lot of"
                    " knowledge about programming language and English, Math in this game you should choose one of programming language or subjects"
                    " after that there are questions and A,B,C,D answer tests you must select one of them when you finish"
                    " selecting all test after submiting you can see your result",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
