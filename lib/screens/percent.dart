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
  bool shouldDisplay = false;

  double finalMark = 0;
  double total = 0;
  double grade = 0;

  dynamic calculatePercentage(var grade, var total) {
    return (double.parse(grade.text) / double.parse(total.text)) * 100;
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
                onChanged: (value) {
                  setState(() {
                    grade = value as double;
                  });
                },
                controller: gradeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your grade',
                ),
              ),
              TextField(
                // ignore: unnecessary_const
                onChanged: (value) {
                  //calculatePercentage(double.parse(gradeController.text),
                  //  int.parse(totalController.text));
                  setState(() {
                    total = value as double;
                  });
                },
                controller: totalController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter maximum mark',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (total != 0) {
                        shouldDisplay = !shouldDisplay;
                        ;
                      }
                    });
                  },
                  child: Text("Calculate percentage")),
              shouldDisplay
                  ? Text(calculatePercentage(grade, total).toString())
                  : Spacer()
            ])));
  }
}
