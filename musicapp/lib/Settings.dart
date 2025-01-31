import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; // Import the ThemeProvider

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: themeProvider.isDarkTheme
            ? Colors.grey[900]
            : Colors.blue, // Dynamic app bar color
      ),
      body: Container(
        color: themeProvider.isDarkTheme
            ? Colors.grey[850]
            : Colors.white, // Dynamic background color
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            // Toggle Theme Option
            ListTile(
              leading: Icon(
                themeProvider.isDarkTheme
                    ? Icons.nightlight_round
                    : Icons.wb_sunny,
                color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
              ),
              title: Text(
                'Toggle Theme',
                style: TextStyle(
                  color:
                      themeProvider.isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              trailing: Switch(
                value: themeProvider.isDarkTheme,
                onChanged: (value) {
                  themeProvider.toggleTheme(); // Toggle the theme
                },
              ),
            ),
            Divider(
                color: themeProvider.isDarkTheme
                    ? Colors.grey[700]
                    : Colors.grey[300]),

            // Other Generic Settings Options
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
              ),
              title: Text(
                'Notifications',
                style: TextStyle(
                  color:
                      themeProvider.isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                // Handle notifications settings
              },
            ),
            ListTile(
              leading: Icon(
                Icons.security,
                color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
              ),
              title: Text(
                'Privacy',
                style: TextStyle(
                  color:
                      themeProvider.isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                // Handle privacy settings
              },
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
              ),
              title: Text(
                'Help & Support',
                style: TextStyle(
                  color:
                      themeProvider.isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                // Handle help & support
              },
            ),
          ],
        ),
      ),
    );
  }
}
