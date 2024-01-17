import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nodir_quiz/files/english_page.dart';
import 'package:nodir_quiz/tools/imag_class.dart';
import 'package:nodir_quiz/tools/size_calculator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Size? containerSize;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Image.asset(
              Images100.mainImg,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: (MediaQuery.of(context).size.width / (411 / 445)) -
                  ((containerSize != null ? containerSize!.height : 0) + 13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  containers(
                    "Quiz",
                    1,
                    onChange: (Size size) {
                      setState(() {
                        containerSize = size;
                      });
                    },
                  ),
                  containers("Settings", 2),
                  containers("History", 3),
                  containers("About", 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget containers(String text, int index,
      {void Function(Size size)? onChange}) {
    return MeasureSize(
      onChange: onChange ?? (Size size) {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 47),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 13),
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                color: Color(0xffA76AE4), blurRadius: 5, spreadRadius: 0.1)
          ], color: Colors.white, borderRadius: BorderRadius.circular(14)),
          child: MaterialButton(
            padding: const EdgeInsets.only(top: 16, bottom: 26),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            onPressed: () {
              switch (index) {
                case 1:
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => EnglishPage()));
                  break;
                case 2:
                  break;
                case 3:
                  break;
                case 4:
                  break;
              }
            },
            child: Text(
              text,
              style: const TextStyle(
                  color: Color(0xff5B1CAE),
                  fontSize: 35,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
