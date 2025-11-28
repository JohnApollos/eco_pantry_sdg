import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import '../models/pantry_item.dart';
import '../services/pantry_provider.dart';

class AddItemScreen extends StatefulWidget {
  final PantryItem? item;

  const AddItemScreen({super.key, this.item});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late String _category;
  late DateTime _expiryDate;
  late DateTime _purchaseDate;
  late int _quantity;

  final List<String> _categories = ['Fruit', 'Dairy', 'Grains', 'Vegetable', 'Meat', 'Other'];

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    if (item != null) {
      _nameController = TextEditingController(text: item.name);
      _category = item.category;
      _expiryDate = item.expiryDate;
      _purchaseDate = item.purchaseDate ?? DateTime.now();
      _quantity = item.quantity;
    } else {
      _nameController = TextEditingController();
      _category = 'Fruit';
      _expiryDate = DateTime.now().add(const Duration(days: 7));
      _purchaseDate = DateTime.now();
      _quantity = 1;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _selectExpiryDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _expiryDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _expiryDate) {
      setState(() {
        _expiryDate = picked;
      });
    }
  }

  Future<void> _selectPurchaseDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _purchaseDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _purchaseDate) {
      setState(() {
        _purchaseDate = picked;
      });
    }
  }

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      if (widget.item != null) {
        // Update existing item
        final updatedItem = widget.item!;
        updatedItem.name = _nameController.text;
        updatedItem.category = _category;
        updatedItem.expiryDate = _expiryDate;
        updatedItem.purchaseDate = _purchaseDate;
        updatedItem.quantity = _quantity;
        
        Provider.of<PantryProvider>(context, listen: false).updateItem(updatedItem);
      } else {
        // Create new item
        final newItem = PantryItem(
          id: const Uuid().v4(),
          name: _nameController.text,
          category: _category,
          expiryDate: _expiryDate,
          purchaseDate: _purchaseDate,
          quantity: _quantity,
        );
        Provider.of<PantryProvider>(context, listen: false).addItem(newItem);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Item Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _category,
                  decoration: const InputDecoration(labelText: 'Category'),
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Quantity:'),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (_quantity > 1) {
                              setState(() {
                                _quantity--;
                              });
                            }
                          },
                        ),
                        Text('$_quantity', style: const TextStyle(fontSize: 18)),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              _quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: const Text('Purchase Date'),
                  subtitle: Text(DateFormat.yMMMd().format(_purchaseDate)),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () => _selectPurchaseDate(context),
                ),
                ListTile(
                  title: const Text('Expiry Date'),
                  subtitle: Text(DateFormat.yMMMd().format(_expiryDate)),
                  trailing: const Icon(Icons.event_busy, color: Colors.red),
                  onTap: () => _selectExpiryDate(context),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveItem,
                    child: const Text('Save Item'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
