import 'package:flutter/material.dart';
import 'package:nodir_quiz/hive_repo/hive_repo.dart';
import 'package:nodir_quiz/tools/imag_class.dart';
import 'package:audioplayers/audioplayers.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool controller = true;
  HiveRepo hiveRepo = HiveRepo();
  final player10 = AudioPlayer();

  @override
  void initState() {
    controller = hiveRepo.getBool();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          height: 200,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffA76AE4))),
                onPressed: () {
                  setState(() {
                    player10.play(AssetSource("audio_player/correct.wav"));
                    if (!controller && a == 0) {
                      a++;
                      player.play(AssetSource("audio_player/quiz_music.mp3"));
                      player.setReleaseMode(ReleaseMode.loop);
                      controller = true;
                    } else {
                      player.resume();
                      controller = true;
                      hiveRepo.saveBool(controller);
                    }
                  });
                },
                icon: Icon(Icons.music_note,
                    size: 20, color: controller ? Colors.white : Colors.blue),
                label: Text(
                  "Turn on music",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: controller ? Colors.white : Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffA76AE4))),
                onPressed: () {
                  setState(() {
                    player10.play(AssetSource("audio_player/correct.wav"));
                    player.pause();
                    controller = false;
                    hiveRepo.saveBool(controller);
                  });
                },
                icon: Icon(
                  Icons.music_off,
                  size: 20,
                  color: controller ? Colors.blue : Colors.white,
                ),
                label: Text(
                  "Turn of music",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: controller ? Colors.blue : Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
