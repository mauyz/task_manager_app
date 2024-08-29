import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/presentation/add_or_update/add_or_update_task_page.dart';
import 'package:task_manager_app/presentation/home/state/task_list_state.dart';
import 'package:task_manager_app/presentation/home/widget/error_text_widget.dart';

class TaskListItem extends ConsumerWidget {
  final Task task;
  const TaskListItem({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return AddOrUpdateTaskPage(task: task);
                },
              ),
            );
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: IconButton(
                  icon: Icon(
                    task.isCompleted
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                  ),
                  onPressed: () {
                    final newValue =
                        task.copyWith(isCompleted: !task.isCompleted);
                    ref
                        .read(taskListStateProvider.notifier)
                        .updateTask(newValue);
                  },
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      task.description,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  confirmDeletionDialog(context, ref);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void confirmDeletionDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.center,
          content: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ErrorTextWidget(
              text: "Voulez-vous supprimer cette tâche ?",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                ref.read(taskListStateProvider.notifier).deleteTask(task.id);
                Navigator.of(context).pop();
              },
              child: const Text("Oui"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Non"),
            ),
          ],
        );
      },
    );
  }
}
