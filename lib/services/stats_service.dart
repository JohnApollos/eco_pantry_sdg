import 'package:hive_flutter/hive_flutter.dart';

class StatsService {
  static const String _boxName = 'statsBox';
  static const String _consumedKey = 'consumedCount';
  static const String _wastedKey = 'wastedCount';

  Future<void> init() async {
    await Hive.openBox(_boxName);
  }

  Box get _box => Hive.box(_boxName);

  int get consumedCount => _box.get(_consumedKey, defaultValue: 0);
  int get wastedCount => _box.get(_wastedKey, defaultValue: 0);

  Future<void> incrementConsumed() async {
    await _box.put(_consumedKey, consumedCount + 1);
  }

  Future<void> incrementWasted() async {
    await _box.put(_wastedKey, wastedCount + 1);
  }

  Future<void> clearStats() async {
    await _box.clear();
  }
}
