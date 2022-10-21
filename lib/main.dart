import 'package:drugs/screens/admin_page.dart';
import 'package:drugs/screens/cart_page.dart';
import 'package:drugs/screens/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drugs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash_Page(),
    );
  }
}

