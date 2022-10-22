import 'package:flutter/material.dart';

class Total extends StatefulWidget {
  const Total({Key? key}) : super(key: key);

  @override
  State<Total> createState() => _TotalState();
}

class _TotalState extends State<Total> {
  final inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculate total grade")),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                // ignore: unnecessary_const
                onChanged: (value) {
                  //calculatePercentage(double.parse(gradeController.text),
                  //  int.parse(totalController.text));
                  setState(() {
                    //total = double.parse(value);
                  });
                },
                //controller: totalController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter maximum mark',
                ),
              ),
            ),
            Expanded(
              child: TextField(
                // ignore: unnecessary_const
                onChanged: (value) {
                  //calculatePercentage(double.parse(gradeController.text),
                  //  int.parse(totalController.text));
                  setState(() {
                    // total = double.parse(value);
                  });
                },
                //controller: totalController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter maximum mark',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
