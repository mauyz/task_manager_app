import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/core/enum/filter_enum.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/presentation/home/state/task_filter_state.dart';
import 'package:task_manager_app/presentation/home/widget/task_list_item.dart';

class TaskListFilteredWidget extends ConsumerWidget {
  final List<Task> data;
  const TaskListFilteredWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(taskFilterStateProvider);
    final filteredList = switch (filter) {
      FilterEnum.all => data,
      FilterEnum.completed => data
          .where(
            (element) => element.isCompleted,
          )
          .toList(),
      FilterEnum.uncompleted => data
          .where(
            (element) => !element.isCompleted,
          )
          .toList(),
    };
    return filteredList.isEmpty
        ? Center(
            child: Text(
              "Aucune tâche",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              return TaskListItem(task: filteredList[index]);
            },
          );
  }
}
