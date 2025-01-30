import 'package:flutter/material.dart';
import 'signin_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, // Default dark theme
      ),
      home: SignIn(),
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
