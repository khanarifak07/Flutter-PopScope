import 'package:flutter/material.dart';
import 'package:flutter_popscope/home.dart';
import 'package:flutter_popscope/page1.dart';
import 'package:flutter_popscope/page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      initialRoute: "/page1",
      routes: {
        '/page1': (context) => const Page1(),
        '/page2': (context) => const Page2()
      },
    );
  }
}
