import 'package:flutter/material.dart';

class Total extends StatefulWidget {
  const Total({Key? key}) : super(key: key);

  @override
  State<Total> createState() => _TotalState();
}

class _TotalState extends State<Total> {
  final inputController = TextEditingController();
  bool numberGrades = false;
  bool displayPercent = false;
  int number = 0;
  double sum = 0;
  List<TextEditingController> controllers = [];
  List<dynamic> grades = [];
  List<dynamic> weights = [];
  List<double> totals = [];

  dynamic calculatePercentage(var grades, var weights) {
    sum = 0;
    for (int i = 0; i < grades.length; i++) {
      double total = grades[i] * weights[i];
      totals.add(total);
    }
    print(totals.toString());
    for (var i = 0; i < totals.length; i++) {
      sum += totals[i];
    }
    grades.clear();
    weights.clear();
    totals.clear();
    displayPercent = false;
    numberGrades = false;

    return sum * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculate total grade")),
      body: SafeArea(
        child: Column(
          children: [
            Text("Please enter number of grades"),
            TextField(
              // ignore: unnecessary_const
              onEditingComplete: () {
                setState(() {
                  number = int.parse(inputController.text);
                  if (number > 0) {
                    numberGrades = true;
                  } else {
                    numberGrades = false;
                  }
                });
              },
              controller: inputController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter number of grades',
              ),
            ),
            numberGrades
                ? Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              ListView.builder(
                                //scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: number,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          // ignore: unnecessary_const
                                          onSubmitted: (value) {
                                            //calculatePercentage(double.parse(gradeController.text),
                                            //  int.parse(totalController.text));
                                            setState(() {
                                              //total = double.parse(value);
                                              double val1 =
                                                  double.parse(value) / 100;
                                              grades.add(val1);
                                            });
                                          },
                                          //controller: totalController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Grade(%)',
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          // ignore: unnecessary_const
                                          onSubmitted: (value) {
                                            //calculatePercentage(double.parse(gradeController.text),
                                            //  int.parse(totalController.text));
                                            setState(() {
                                              double val1 =
                                                  double.parse(value) / 100;
                                              // total = double.parse(value);
                                              weights.add(val1);
                                            });
                                          },
                                          //controller: totalController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Weight',
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (grades.isNotEmpty) {
                                        displayPercent = true;
                                      }
                                    });
                                  },
                                  child: Text("Calculate percentage")),
                              displayPercent
                                  ? Text(
                                      calculatePercentage(grades, weights)
                                              .toStringAsFixed(2) +
                                          "%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30))
                                  : Spacer()
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Spacer(),
          ],
        ),
      ),
    );
  }
}
