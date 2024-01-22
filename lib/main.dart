import 'package:flutter/material.dart';
import 'package:nodir_quiz/files/splesh_page.dart';
import "package:hive/hive.dart";
import "package:hive_flutter/hive_flutter.dart";

main() async {
  int a = 0;
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("history");
  await Hive.openBox("history1");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
