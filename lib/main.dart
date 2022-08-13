import 'package:flutter/material.dart';

import 'home/home.dart';

void main() {
  runApp(const CancerApp());
}

class CancerApp extends StatelessWidget {
  const CancerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '天天爱做替',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}
