import 'package:flutter/material.dart';

import '../model_class/quiz_class.dart';
import '../services/Quiz_service.dart';


class UpdateQuizTaskView extends StatefulWidget {
  final QuizModel model;
  const UpdateQuizTaskView({super.key, required this.model});

  @override
  State<UpdateQuizTaskView> createState() => _UpdateQuizTaskViewState();
}

class _UpdateQuizTaskViewState extends State<UpdateQuizTaskView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    titleController = TextEditingController(
        text: widget.model.name.toString()
    );
    descriptionController = TextEditingController(
        text: widget.model.description.toString()
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Task")),
      body: Column(
        children: [
          TextField(controller: titleController),
          TextField(controller: descriptionController),

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
                setState(() {

                });
                await QuizService()
                    .updateQuizTask(
                  QuizModel(
                    name: titleController.text,
                    description: descriptionController.text,
                    docId: widget.model.docId,
                  ),
                )
                    .then((val) {
                  isLoading = false;
                  setState(() {

                  });
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Message"),
                        content: Text(
                          "Quiz Task has been updated successfully",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
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
                setState(() {

                });
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
            child: Text("Update Quiz Task"),
          ),
        ],
      ),
    );
  }
}