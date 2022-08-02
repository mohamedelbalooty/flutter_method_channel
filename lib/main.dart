import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() => runApp(const FlutterMethodChannel());

class FlutterMethodChannel extends StatelessWidget {
  const FlutterMethodChannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Method Channel',
      home: HomeScreen(),
    );
  }
}

