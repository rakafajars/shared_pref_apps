import 'package:flutter/material.dart';
import 'package:shared_pref_app/model/task_model.dart';

class DetailTaskPage extends StatefulWidget {
  final TaskModel taskModel;
  const DetailTaskPage({super.key, required this.taskModel});

  @override
  State<DetailTaskPage> createState() => _DetailTaskPageState();
}

class _DetailTaskPageState extends State<DetailTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Task'),
      ),
      body: Center(child: Text(widget.taskModel.taskName ?? "")),
    );
  }
}
