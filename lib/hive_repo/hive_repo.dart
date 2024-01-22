import 'package:hive/hive.dart';

class HiveRepo {
  final Box _box = Hive.box("history");

  saveHistoryEnglish(Map<String, String> map) {
    _box.put("english", map);
  }

  getHistoryEnglish() {
    Map<dynamic, dynamic> helper =
        _box.get("english", defaultValue: <String, String>{});
    Map<String, String> map = {};
    helper.forEach((key, value) {
      map[key.toString()] = value.toString();
    });

    return map;
  }

  saveHistoryMath(Map<String, String> map) {
    _box.put("math", map);
  }

  getHistoryMath() {
    Map<dynamic, dynamic> helper =
        _box.get("math", defaultValue: <String, String>{});
    Map<String, String> map = {};
    helper.forEach((key, value) {
      map[key.toString()] = value.toString();
    });

    return map;
  }

  saveHistoryDart(Map<String, String> map) {
    _box.put("dart", map);
  }

  getHistoryDart() {
    Map<dynamic, dynamic> helper =
        _box.get("dart", defaultValue: <String, String>{});
    Map<String, String> map = {};
    helper.forEach((key, value) {
      map[key.toString()] = value.toString();
    });

    return map;
  }
}
