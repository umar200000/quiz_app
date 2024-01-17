import 'package:flutter/material.dart';
import 'package:nodir_quiz/tools/imag_class.dart';

class WinPage extends StatefulWidget {
  final int sum;
  final int length100;
  const WinPage({super.key, required this.sum, required this.length100});

  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {
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
