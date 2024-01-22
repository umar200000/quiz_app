import 'package:flutter/material.dart';
import 'package:nodir_quiz/hive_repo/hive_repo.dart';
import 'package:nodir_quiz/tools/imag_class.dart';

class WinPage extends StatefulWidget {
  final int sum;
  final int length100;
  final int index;

  const WinPage(
      {super.key,
      required this.sum,
      required this.length100,
      required this.index});

  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {
  HiveRepo hiveRepo = HiveRepo();
  Map<String, String> map = {};

  @override
  void initState() {
    int n = widget.index;
    String historyTime = DateTime.now().toString();
    map = n == 0
        ? hiveRepo.getHistoryEnglish()
        : n == 1
            ? hiveRepo.getHistoryMath()
            : hiveRepo.getHistoryDart();

    map["Time: $historyTime"] = "Result: ${widget.sum}/${widget.length100}";
    n == 0
        ? hiveRepo.saveHistoryEnglish(map)
        : n == 1
            ? hiveRepo.saveHistoryMath(map)
            : hiveRepo.saveHistoryDart(map);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Images100.resultImg, fit: BoxFit.fill),
          Center(
            child: Text(
              "${widget.sum}/${widget.length100}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ],
      ),
    ));
  }
}
