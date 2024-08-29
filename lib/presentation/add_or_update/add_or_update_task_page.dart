import 'package:flutter/material.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/presentation/add_or_update/layout/operation_form_layout.dart';
import 'package:task_manager_app/presentation/home/widget/simple_app_bar.dart';

class AddOrUpdateTaskPage extends StatelessWidget {
  final Task? task;
  const AddOrUpdateTaskPage({
    super.key,
    this.task,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: Text(
          task == null ? "Ajouter une nouvelle tâche" : "Modifier une tâche",
        ),
      ),
      body: OperationFormLayout(task: task),
    );
  }
}
