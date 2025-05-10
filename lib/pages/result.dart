import 'dart:math';

import 'package:bmi_plus_app/colors/colors.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;
  final bool isMale;
  const ResultPage({
    super.key,
    required this.height,
    required this.weight,
    required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    double bmiCalc = weight / pow(height / 100, 2);
    String result = '';
    switch (bmiCalc) {
      case < 18.5:
        result = "Thin";
        break;

      case >= 18.5 && < 24.9:
        result = "Normal";
        break;

      case > 24.9 && <= 29.9:
        result = "OverWeight";
        break;

      case >= 30:
        result = "obese";
        break;
    }
    return Scaffold(
      backgroundColor: isMale ? blue : red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  "BMI IS:",
                  style: TextStyle(
                    color: white,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  bmiCalc.toStringAsFixed(1),
                  style: TextStyle(
                    color: white,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  result,
                  style: TextStyle(
                    color: white,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 30),

                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_circle_left, color: white, size: 40),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
