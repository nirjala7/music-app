import 'package:flutter/material.dart';
import 'signin_page.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; // Import the ThemeProvider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Toggle App',
      theme: themeProvider.isDarkTheme
          ? ThemeData.dark() // Dark theme
          : ThemeData.light(), // Light theme
      home: SignIn(), // Set the SignIn page as the home
    );
  }
}

class BlankPage extends StatelessWidget {
  final String title;
  BlankPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'This page is under construction.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
