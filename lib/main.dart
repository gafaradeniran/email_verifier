import 'package:flutter/material.dart';
import 'package:verify_mail/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-mail Verifier',
      theme: ThemeData(),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
