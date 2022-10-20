import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Percent extends StatefulWidget {
  const Percent({Key? key}) : super(key: key);

  @override
  State<Percent> createState() => _PercentState();
}

class _PercentState extends State<Percent> {
  final gradeController = TextEditingController();
  final totalController = TextEditingController();

  double finalMark = 0;

  dynamic calculatePercentage(double grade, double total) {
    double percentage = (grade / total) * 100;
    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: const Text("Convert grade to percentage")),
      ),
      body: SafeArea(
          child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          TextField(
            // ignore: unnecessary_const
            onChanged: (text) {},
            controller: gradeController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your grade',
            ),
          ),
          TextField(
            // ignore: unnecessary_const
            onChanged: (text) {
              //calculatePercentage(double.parse(gradeController.text),
              //  int.parse(totalController.text));
            },
            controller: totalController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter maximum mark',
            ),
          ),
          ElevatedButton(
              onPressed: finalMark = calculatePercentage(
                  double.parse(gradeController.text),
                  double.parse(totalController.text)),
              child: Text("Calculate percentage")),
          TextField(
            // ignore: unnecessary_const
            onChanged: (text) {},
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: finalMark,
            ),
          ),
        ],
      )),
    );
  }
}
