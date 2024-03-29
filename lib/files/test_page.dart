import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nodir_quiz/files/win_page.dart';
import 'package:nodir_quiz/hive_repo/hive_repo.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:nodir_quiz/tools/model_list.dart';

import '../tools/imag_class.dart';
import '../tools/size_calculator.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key, required this.index});

  final int index;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int a = 0;
  int a1 = 0;
  int index = 0;
  int number = 0;
  int cuntrolerIndex = 0;
  List<String> checkList = [];
  String answer = "";
  Size? containterSize;
  Size? questionSize;
  bool t = false;
  HiveRepo hiveRepo = HiveRepo();
  final player100 = AudioPlayer();
  final player1 = AudioPlayer();

  @override
  void initState() {
    t = hiveRepo.getBool();
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              lessonList[index].lessonIcon,
              alignment: Alignment.topCenter,
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / (411 / 451)) -
                  (questionSize != null ? questionSize!.height : 0) -
                  19,
              // bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MeasureSize(
                    onChange: (Size size) {
                      setState(() {
                        questionSize = size;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 47),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(157, 87, 227, 0.25),
                                  offset: Offset(0, 2),
                                  blurRadius: 13,
                                  spreadRadius: 4)
                            ],
                            borderRadius: BorderRadius.circular(14)),
                        padding: const EdgeInsets.symmetric(vertical: 46),
                        margin: const EdgeInsets.only(bottom: 29),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            lessonList[index]
                                .lessonList10[cuntrolerIndex]
                                .question,
                            style: TextStyle(
                                color: Color(0xff5B1CAE),
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  ),
                  helper(
                      "A",
                      lessonList[index].lessonList10[cuntrolerIndex].answerA,
                      1),
                  helper(
                      "B",
                      lessonList[index].lessonList10[cuntrolerIndex].answerB,
                      2),
                  helper(
                      "C",
                      lessonList[index].lessonList10[cuntrolerIndex].answerC,
                      3),
                  helper(
                      "D",
                      lessonList[index].lessonList10[cuntrolerIndex].answerD,
                      4),
                  SizedBox(
                    height: 36,
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 59, vertical: 9),
                    color: Color(0xffA76AE4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () {
                      setState(() {
                        if (answer == "") {
                          player1.play(AssetSource("audio_player/error.mp3"));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("you must choice one answer"),
                            duration: Duration(seconds: 1),
                          ));
                          return;
                        }
                        player1.play(AssetSource("audio_player/shuffle.mp3"));
                        checkList.add(answer);
                        answer = "";
                        number = 0;
                        if (cuntrolerIndex ==
                            lessonList[index].lessonList10.length - 1) {
                          int count = 0;
                          for (int i = 0;
                              i < lessonList[index].lessonList10.length;
                              i++) {
                            if (checkList[i] ==
                                lessonList[index].lessonList10[i].correctAnswer)
                              count++;
                          }
                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => WinPage(
                                        sum: count,
                                        length100: lessonList[index]
                                            .lessonList10
                                            .length,
                                        index: index,
                                      )));
                        }
                        if (cuntrolerIndex <
                            lessonList[index].lessonList10.length - 1) {
                          cuntrolerIndex++;
                        }
                      });
                    },
                    child: Text(
                      cuntrolerIndex < lessonList[index].lessonList10.length - 1
                          ? "Next"
                          : "Submit",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 30,
              right: 10,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    player100.play(AssetSource("audio_player/correct.wav"));
                    t = !t;
                    hiveRepo.saveBool(t);
                    if (t) player.resume();
                    player.pause();
                  });
                },
                icon: t
                    ? Icon(
                        Icons.music_note,
                        size: 40,
                        color: Colors.blue,
                      )
                    : Icon(
                        Icons.music_off,
                        size: 40,
                        color: Colors.blue,
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget helper(String char, String test, int n) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 47,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: number == n
                    ? Colors.red
                    : Color.fromRGBO(157, 87, 227, 0.25),
                offset: number == n ? Offset(0, 0) : Offset(0, 2),
                blurRadius: number == n ? 0 : 13,
                spreadRadius: number == n ? 2 : 4)
          ],
          borderRadius: BorderRadius.circular(14),
        ),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 13),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          onPressed: () {
            setState(() {
              player100.play(AssetSource("audio_player/correct.wav"));
              number = n;
              answer = test;
            });
          },
          child: Row(
            children: [
              SizedBox(
                width: 19,
              ),
              Text(
                char,
                style: TextStyle(
                    color: Color(0xff5B1CAE),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 11,
              ),
              Expanded(
                child: Text(
                  test,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 48,
              )
            ],
          ),
        ),
      ),
    );
  }
}
