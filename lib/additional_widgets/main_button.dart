import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nodir_quiz/helper_pages/about_page.dart';
import 'package:nodir_quiz/helper_pages/history_page.dart';
import 'package:nodir_quiz/helper_pages/setting_page.dart';
import 'package:nodir_quiz/tools/size_calculator.dart';

import '../files/quizs_page.dart';
import 'package:audioplayers/audioplayers.dart';

class MainButton extends StatelessWidget {
  MainButton({
    super.key,
    required this.text,
    required this.index,
    this.onChange,
  });

  final String text;
  final int index;
  final void Function(Size size)? onChange;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MeasureSize(
      onChange: onChange ?? (Size size) {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 47),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 13),
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(157, 87, 227, 0.25),
              blurRadius: 13,
              spreadRadius: 4,
              offset: Offset(0, 2),
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(14)),
          child: MaterialButton(
            padding: const EdgeInsets.only(top: 16, bottom: 26),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            onPressed: () {
              player.play(AssetSource("audio_player/interfes.mp3"));
              switch (index) {
                case 1:
                  Future.delayed(Duration(milliseconds: 300), () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const QuizsPage()));
                  });
                  break;
                case 2:
                  Future.delayed(Duration(milliseconds: 300), () {
                    showDialog(
                        context: context, builder: (context) => SettingPage());
                  });
                  break;
                case 3:
                  Future.delayed(Duration(milliseconds: 300), () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => HistoryPage()));
                  });
                  break;
                case 4:
                  Future.delayed(Duration(milliseconds: 300), () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => AboutPage()));
                  });
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
