import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/pantry_provider.dart';
import '../services/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return ListView(
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                subtitle: const Text('Use system theme or force dark mode'),
                value: themeProvider.themeMode == ThemeMode.dark,
                onChanged: (bool value) {
                  themeProvider.toggleTheme(value);
                },
              ),
              const Divider(),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text('Clear All Data'),
            subtitle: const Text('Delete all items and reset stats'),
            onTap: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Clear Data?'),
                  content: const Text('This action cannot be undone.'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                    TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Clear', style: TextStyle(color: Colors.red))),
                  ],
                ),
              );

              if (confirmed == true) {
                // We need a method in provider to clear everything
                 // For now, let's just clear stats and items manually if needed
                 // Ideally PantryProvider should have a clearAll method
                 // Let's implement a simple clear for now
                 final provider = Provider.of<PantryProvider>(context, listen: false);
                 // We need to iterate and delete or add a clear method to StorageService
                 // For MVP, let's just show a message or implement clearAll in provider
                 ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(content: Text('Feature coming soon!')),
                 );
              }
            },
          ),
            ],
          );
        },
      ),
    );
  }
}
