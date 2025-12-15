/*
import 'package:flutter/material.dart';
import 'package:task/model_class/priority_class.dart';
import 'package:task/services/priovrity_service.dart';
import 'package:task/view/get_all_task.dart';

import '../model_class/task_class.dart';
import '../services/task_service.dart';

class CreateTaskView extends StatefulWidget {
  CreateTaskView({super.key, required bool isUpdateMode,  });

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  bool isLoading = false;
  List<ModelClass> priorityList=[];
  ModelClass? _selectedPriority;
  @override
  void initState(){
    ModelService().getAllModelService().then((val){
      priorityList=val;
      setState(() {});
      super.initState();

  });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Task View")),
      body: Column(
        children: [
          TextField(controller: titleController),
          TextField(controller: descriptionController),
          DropdownButton(items: priorityList.map((e){
            return DropdownMenuItem(
              value: e,
                child: Text(e.name.toString()));
          }).toList(),
              value: _selectedPriority,
              isExpanded: true,
              hint: Text("select priority"),
              onChanged: (val){
            _selectedPriority=val;
              }),
          SizedBox(height: 20),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : ElevatedButton(
            onPressed: () async {
              if (titleController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Title cannot be empty.")),
                );
                return;
              }
              if (descriptionController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Description cannot be empty.")),
                );
                return;
              }
              try {
                isLoading = true;
                setState(() {});
                await TaskServices()
                    .createTask(
                  PriorityModel(
                    title: titleController.text,
                    description: descriptionController.text,
                    isCompleted: false,
                    priorityID: _selectedPriority!.docId.toString(),
                    createdAt: DateTime.now().millisecondsSinceEpoch,
                  ),
                )
                    .then((val) {
                  isLoading = false;
                  setState(() {});
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Message"),
                        content: Text(
                          "Task has been created successfully",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>GetAllTaskView()));
                            },
                            child: Text("Okay"),
                          ),
                        ],
                      );
                    },
                  );
                });
              } catch (e) {
                isLoading = false;
                setState(() {});
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
            child: Text("Create Task"),
          ),
        ],
      ),
    );
  }
}*/
