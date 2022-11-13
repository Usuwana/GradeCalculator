import 'package:flutter/material.dart';
import 'package:gradecalculator/screens/percent.dart';
import 'package:gradecalculator/screens/total.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grade Calculator")),
      body: Container(
        margin: EdgeInsets.only(top: 200),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Total()),
                    );
                  },
                  child: Text("Calculate total percentage grade")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Percent()),
                    );
                  },
                  child: Text("Convert grade to percentage"))
            ],
          ),
        ),
      ),
    );
  }
}
