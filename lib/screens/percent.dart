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
    return (grade / total) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: const Text("Convert grade to percentage")),
        ),
        body: SafeArea(
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              SizedBox(
                height: 200,
              ),
              TextField(
                // ignore: unnecessary_const
                onChanged: (value) {
                  setState(() {
                    grade = double.parse(value);
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
                    total = double.parse(value);
                  });
                },
                controller: totalController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter maximum mark',
                ),
              ),
              SizedBox(height: 30),
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
                  ? Column(
                      children: [
                        SizedBox(height: 50),
                        Text(
                          calculatePercentage(grade, total).toStringAsFixed(2) +
                              "%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    )
                  : Spacer()
            ])));
  }
}
