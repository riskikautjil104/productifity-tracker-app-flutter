import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/task_controller.dart';

class CrewTaskView extends GetView<CrewTaskController> {
  const CrewTaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CrewTaskView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CrewTaskView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
