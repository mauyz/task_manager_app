import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/domain/model/task.dart';

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
            //TODO
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
                    // TODO
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
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  //TODO
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
