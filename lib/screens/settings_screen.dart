import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil instance ThemeProvider dari context
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.settings),
            SizedBox(width: 8),
            Text('Settings'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appearance',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium, // Menggunakan gaya tema aktif
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(
                value: themeProvider.isDarkMode, // Menampilkan status dark mode
                onChanged: (value) {
                  // Mengubah status tema
                  themeProvider.toggleTheme();
                },
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 16),
            Text(
              'Additional Info',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ListTile(
              title: Text('Version'),
              subtitle: Text('1.0.0'),
            ),
          ],
        ),
      ),
    );
  }
}
