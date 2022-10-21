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

  dynamic calculatePercentage(
      TextEditingController grade, TextEditingController total) {
    // return (double.parse(grade.text) / double.parse(total.text)) * 100;
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
              onPressed: finalMark =
                  calculatePercentage(gradeController, totalController),
              child: Text("Calculate percentage")),
          RichText(
            text: TextSpan(
              text: finalMark.toString(),
              style: DefaultTextStyle.of(context).style,
            ),
          )
        ],
      )),
    );
  }
}
