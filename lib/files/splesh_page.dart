import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nodir_quiz/files/main_page.dart';
import 'package:nodir_quiz/hive_repo/hive_repo.dart';
import 'package:nodir_quiz/tools/imag_class.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => const MainPage())));
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
            Images100.splashImg,
            fit: BoxFit.fill,
          ),
          const Center(
            child: Text(
              "QuizApp",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.1),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  color: Colors.purple.shade100,
                )),
          )
        ],
      ),
    ));
  }
}
