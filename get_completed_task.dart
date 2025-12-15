import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model_class/task_class.dart';
import '../services/task_service.dart';

class GetCompletedTaskView extends StatelessWidget {
  const GetCompletedTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get Completed Task")),
      body: StreamProvider.value(
        value: TaskServices().getCompletedTask(),
        initialData: [PriorityModel()],
        builder: (context, child) {
          List<PriorityModel> taskList = context.watch<List<PriorityModel>>();
          return ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, i) {
              return ListTile(
                leading: Icon(Icons.task),
                title: Text(taskList[i].title.toString()),
                subtitle: Text(taskList[i].description.toString()),
              );
            },
          );
        },
      ),
    );
  }
}