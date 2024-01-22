import 'package:flutter/material.dart';
import 'package:nodir_quiz/hive_repo/hive_repo.dart';
import 'package:nodir_quiz/tools/imag_class.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int controller = 0;
  int length100 = 0;
  Map<String, String> mapEnglish = {};
  List<String> keysListEnglish = [];
  List<String> valueListEnglish = [];
  Map<String, String> mapMath = {};
  List<String> keysListMath = [];
  List<String> valueListMath = [];
  Map<String, String> mapDart = {};
  List<String> keysListDart = [];
  List<String> valueListDart = [];
  HiveRepo hiveRepo = HiveRepo();

  List<Widget> list = [
    Image.asset(
      Images100.historyEnglishImg,
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
    ),
    Image.asset(
      Images100.historyMath,
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
    ),
    Image.asset(
      Images100.historyDart,
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
    ),
  ];

  @override
  void initState() {
    mapEnglish = hiveRepo.getHistoryEnglish();
    mapMath = hiveRepo.getHistoryMath();
    mapDart = hiveRepo.getHistoryDart();
    mapEnglish.forEach((key, value) {
      keysListEnglish.add(key);
      valueListEnglish.add(value);
    });
    mapMath.forEach((key, value) {
      keysListMath.add(key);
      valueListMath.add(value);
    });
    mapDart.forEach((key, value) {
      keysListDart.add(key);
      valueListDart.add(value);
    });

    hiveRepo.saveHistoryEnglish(mapEnglish);
    hiveRepo.saveHistoryMath(mapMath);
    hiveRepo.saveHistoryDart(mapDart);
    length100 = keysListEnglish.length;
    super.initState();
  }

  helper(String str) {
    int index = str.indexOf('.');
    return str.substring(0, index);
  }

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
              bottom: 0,
              top: 0,
              child: list[controller],
            ),
            Positioned(
              left: 5,
              right: 5,
              bottom: 67,
              top: 17 + 248 + 20,
              child: ListView.builder(
                // itemExtent: 80,
                itemCount: length100,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(
                      controller == 0
                          ? valueListEnglish[index]
                          : controller == 1
                              ? valueListMath[index]
                              : valueListDart[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      controller == 0
                          ? helper(keysListEnglish[index])
                          : controller == 1
                              ? helper(keysListMath[index])
                              : helper(keysListDart[index]),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        deleteHistory(index);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ));
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomNavigationBar(
                currentIndex: controller,
                onTap: (index) {
                  setState(() {
                    controller = index;
                    deleteIndex();
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Images100.englishImg,
                      height: 30,
                      width: 30,
                    ),
                    label: "English",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Images100.mathImg,
                      height: 30,
                      width: 30,
                    ),
                    label: "Math",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Images100.dartImg,
                      height: 30,
                      width: 30,
                    ),
                    label: "Dart",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  deleteIndex() {
    controller == 0
        ? length100 = keysListEnglish.length
        : controller == 1
            ? length100 = keysListMath.length
            : length100 = keysListDart.length;
  }

  deleteHistory(int index) {
    setState(() {
      if (controller == 0) {
        mapEnglish.remove(keysListEnglish[index]);
        keysListEnglish.removeAt(index);
        valueListEnglish.removeAt(index);
        hiveRepo.saveHistoryEnglish(mapEnglish);
      } else if (controller == 1) {
        mapMath.remove(keysListMath[index]);
        keysListMath.removeAt(index);
        valueListMath.removeAt(index);
      } else {
        mapDart.remove(keysListDart[index]);
        keysListDart.removeAt(index);
        valueListDart.removeAt(index);
      }
      deleteIndex();
    });
  }
}
