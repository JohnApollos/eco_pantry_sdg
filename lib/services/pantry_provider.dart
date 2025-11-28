import 'package:flutter/foundation.dart';
import '../models/pantry_item.dart';
import 'storage_service.dart';
import 'stats_service.dart';

class PantryProvider extends ChangeNotifier {
  final StorageService _storageService = StorageService();
  final StatsService _statsService = StatsService();
  List<PantryItem> _items = [];

  List<PantryItem> get items => _items;
  int get consumedCount => _statsService.consumedCount;
  int get wastedCount => _statsService.wastedCount;

  Future<void> init() async {
    await _storageService.init();
    await _statsService.init();
    _loadItems();
  }

  void _loadItems() {
    _items = _storageService.getItems();
    notifyListeners();
  }

  Future<void> addItem(PantryItem item) async {
    await _storageService.addItem(item);
    _loadItems();
  }

  Future<void> deleteItem(String id) async {
    await _storageService.deleteItem(id);
    _loadItems();
  }

  Future<void> updateItem(PantryItem item) async {
    await _storageService.updateItem(item);
    _loadItems();
  }

  Future<void> consumeItem(String id) async {
    await _storageService.consumeItem(id);
    await _statsService.incrementConsumed();
    _loadItems();
  }

  Future<void> wasteItem(String id) async {
    await _storageService.wasteItem(id);
    await _statsService.incrementWasted();
    _loadItems();
  }
}
