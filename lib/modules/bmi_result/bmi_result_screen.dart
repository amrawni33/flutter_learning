import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  const BMIResult(
      {super.key,
      required this.isMale,
      required this.age,
      required this.result});
  final int age;
  final int result;
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Result',
        ),
      ),
      body: Center(
        child: Container(
          height: 220.0,
          width: 220.0,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Gender : ${isMale ? 'male' : 'female'}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              Text(
                'Result : $result',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              Text(
                'Age : $age',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
