import 'package:flutter/material.dart';

class SecondTask extends StatefulWidget {
  const SecondTask({super.key});

  @override
  State<SecondTask> createState() => _SecondTaskState();
}

class _SecondTaskState extends State<SecondTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text('Dynamic Form')),
  );
  }
}
