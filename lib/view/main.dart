import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resep Makanan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,textTheme: 
        TextTheme(TextStyle (color: Colors.white))),
      home: Scaffold(),
    );
  }
}

