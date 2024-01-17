import 'package:flutter/material.dart';
import 'package:nodir_quiz/additional_widgets/main_button.dart';
import 'package:nodir_quiz/tools/imag_class.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Size? containerSize;

  @override
  Widget build(BuildContext context) {
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
                  MainButton(
                    text: "Quiz",
                    index: 1,
                    onChange: (Size size) {
                      setState(() {
                        containerSize = size;
                      });
                    },
                  ),
                  const MainButton(text: "Settings", index: 2),
                  const MainButton(text: "History", index: 3),
                  const MainButton(text: "About", index: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
