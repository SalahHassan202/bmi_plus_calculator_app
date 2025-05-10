import 'package:bmi_plus_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiPlusApp());
}

class BmiPlusApp extends StatelessWidget {
  const BmiPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
