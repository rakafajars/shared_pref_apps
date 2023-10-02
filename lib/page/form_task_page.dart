import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_pref_app/model/task_model.dart';
import 'package:shared_pref_app/provider/task_provider.dart';

class FormTaskPage extends StatefulWidget {
  final bool? isEdit;
  final TaskModel? taskModel;
  const FormTaskPage({super.key, this.isEdit, required this.taskModel});

  @override
  State<FormTaskPage> createState() => _FormTaskPageState();
}

class _FormTaskPageState extends State<FormTaskPage> {
  final TextEditingController _nameTaskController = TextEditingController();

  @override
  void initState() {
    _nameTaskController.text = widget.taskModel?.taskName ?? "";
    super.initState();
  }

  @override
  void dispose() {
    _nameTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.isEdit == true ? "Edit" : "Input"} Task'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameTaskController,
          ),
          ElevatedButton(
            onPressed: () {
              if (widget.isEdit == true) {
                Provider.of<TaskProvider>(context, listen: false).updateTask(
                  TaskModel(
                      taskName: _nameTaskController.text,
                      id: widget.taskModel?.id),
                );
              } else {
                Provider.of<TaskProvider>(context, listen: false).addTask(
                  TaskModel(
                    taskName: _nameTaskController.text,
                  ),
                );
              }
              Navigator.pop(context);
            },
            child: Text(widget.isEdit == true ? "Edit" : 'Simpan'),
          )
        ],
      ),
    );
  }
}
