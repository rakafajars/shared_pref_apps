import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_pref_app/page/detail_task_page.dart';
import 'package:shared_pref_app/page/form_task_page.dart';
import 'package:shared_pref_app/page/splash_page.dart';
import 'package:shared_pref_app/provider/task_provider.dart';
import 'package:shared_pref_app/utils/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;
  String? password;
  String? email;

  void initial() async {
    username = await SharedPref().getToken();

    setState(() {});
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          if (taskProvider.listTaskModel.isNotEmpty) {
            return ListView.builder(
              itemCount: taskProvider.listTaskModel.length,
              itemBuilder: (context, int index) {
                final data = taskProvider.listTaskModel[index];
                return InkWell(
                  onTap: () async {
                    final detailTaskModel =
                        await taskProvider.getTaskById(data.id ?? 0);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailTaskPage(
                          taskModel: detailTaskModel,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(data.taskName ?? "-"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            taskProvider.deleteTask(data.id ?? 0);
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FormTaskPage(
                                  isEdit: true,
                                  taskModel: data,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Data Kosong'),
            );
          }
        },
      ),
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormTaskPage(
                isEdit: false,
                taskModel: null,
              ),
            ),
          );
        },
      ),
    );
  }
}
