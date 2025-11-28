import 'package:hive_flutter/hive_flutter.dart';
import '../models/pantry_item.dart';

class StorageService {
  static const String _boxName = 'pantryBox';

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PantryItemAdapter());
    await Hive.openBox<PantryItem>(_boxName);
  }

  Box<PantryItem> get _box => Hive.box<PantryItem>(_boxName);

  List<PantryItem> getItems() {
    final items = _box.values.where((item) => !item.isConsumed && !item.isWasted).toList();
    items.sort((a, b) => a.expiryDate.compareTo(b.expiryDate));
    return items;
  }

  Future<void> addItem(PantryItem item) async {
    await _box.put(item.id, item);
  }

  Future<void> deleteItem(String id) async {
    await _box.delete(id);
  }

  Future<void> updateItem(PantryItem item) async {
    await _box.put(item.id, item);
  }

  Future<void> consumeItem(String id) async {
    final item = _box.get(id);
    if (item != null) {
      item.isConsumed = true;
      await item.save();
    }
  }

  Future<void> wasteItem(String id) async {
    final item = _box.get(id);
    if (item != null) {
      item.isWasted = true;
      await item.save();
    }
  }
}
