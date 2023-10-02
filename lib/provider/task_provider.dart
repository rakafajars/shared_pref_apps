import 'package:flutter/material.dart';
import 'package:shared_pref_app/database_helper/database_helper.dart';
import 'package:shared_pref_app/model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> _listTaskModel = [];
  List<TaskModel> get listTaskModel => _listTaskModel;

  late DatabaseHelper _databaseHelper;

  TaskProvider() {
    _databaseHelper = DatabaseHelper();
    _getAllTask();
  }

  void _getAllTask() async {
    _listTaskModel = await _databaseHelper.getTasks();

    notifyListeners();
  }

  Future<void> addTask(TaskModel taskModel) async {
    await _databaseHelper.insertTask(taskModel);
    _getAllTask();
  }

  Future<TaskModel> getTaskById(int id) async {
    return await _databaseHelper.getTaskById(id);
  }

  void updateTask(TaskModel taskModel) async {
    await _databaseHelper.updateTask(taskModel);
    _getAllTask();
  }

  void deleteTask(int id) async {
    await _databaseHelper.deleteTask(id);
    _getAllTask();
  }
}
