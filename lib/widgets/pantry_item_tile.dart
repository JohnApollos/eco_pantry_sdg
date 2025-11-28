import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/pantry_item.dart';
import '../services/pantry_provider.dart';
import '../screens/add_item_screen.dart';

class PantryItemTile extends StatelessWidget {
  final PantryItem item;

  const PantryItemTile({
    super.key,
    required this.item,
  });

  Color _getStatusColor(DateTime expiryDate) {
    final now = DateTime.now();
    final difference = expiryDate.difference(now).inDays;

    if (difference < 3) {
      return Colors.red;
    } else if (difference <= 7) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor(item.expiryDate);
    final formattedDate = DateFormat.yMMMd().format(item.expiryDate);

    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              Provider.of<PantryProvider>(context, listen: false).consumeItem(item.id);
            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.restaurant,
            label: 'Consume',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              Provider.of<PantryProvider>(context, listen: false).wasteItem(item.id);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Waste',
          ),
        ],
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(Icons.circle, color: color),
          ),
          title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('${item.category} • Expires: $formattedDate\nQty: ${item.quantity}'),
          onLongPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddItemScreen(item: item)),
            );
          },
        ),
      ),
    );
  }
}
