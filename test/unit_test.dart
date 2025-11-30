import 'package:flutter_test/flutter_test.dart';
import 'package:eco_pantry/models/pantry_item.dart';

void main() {
  group('PantryItem', () {
    test('should create a valid PantryItem', () {
      final date = DateTime.now();
      final item = PantryItem(
        id: '1',
        name: 'Apple',
        category: 'Fruit',
        expiryDate: date,
        quantity: 5,
      );

      expect(item.id, '1');
      expect(item.name, 'Apple');
      expect(item.category, 'Fruit');
      expect(item.expiryDate, date);
      expect(item.quantity, 5);
      expect(item.isConsumed, false);
      expect(item.isWasted, false);
    });

    test('should have default values', () {
      final date = DateTime.now();
      final item = PantryItem(
        id: '1',
        name: 'Banana',
        category: 'Fruit',
        expiryDate: date,
      );

      expect(item.quantity, 1);
      expect(item.isConsumed, false);
      expect(item.isWasted, false);
      expect(item.purchaseDate, null);
    });
  });
}
