import 'package:hive/hive.dart';

part 'pantry_item.g.dart';

@HiveType(typeId: 0)
class PantryItem extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String category;

  @HiveField(3)
  DateTime expiryDate;

  @HiveField(4, defaultValue: 1)
  int quantity;

  @HiveField(5)
  DateTime? purchaseDate;

  @HiveField(6, defaultValue: false)
  bool isConsumed;

  @HiveField(7, defaultValue: false)
  bool isWasted;

  PantryItem({
    required this.id,
    required this.name,
    required this.category,
    required this.expiryDate,
    this.quantity = 1,
    this.purchaseDate,
    this.isConsumed = false,
    this.isWasted = false,
  });
}
