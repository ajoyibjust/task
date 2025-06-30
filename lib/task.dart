import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  String res = "";

  void cal() {
    final input1 = double.parse(controller1.text);
    final input2 = double.parse(controller2.text);
    final input3 = double.parse(controller3.text);
    final input4 = double.parse(controller4.text);
    double prica = 0;
    if (input1 <= 5) {
      prica = input1 * input2;
    } else if (input1 <= 10) {
      prica = (5 * input2) + ((input1 - 5) * input3);
    } else {
      prica = (5 * input2) + (5 * input3) + ((input1 - 10) * input4);
    }

    setState(() {
      res = "$prica";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            TextField(controller: controller1),
            TextField(controller: controller2),
            TextField(controller: controller3),
            TextField(controller: controller4),
            ElevatedButton(onPressed: cal, child: Text("hisoblash")),
            Text(res),
          ],
        ),
      ),
    );
  }
}
