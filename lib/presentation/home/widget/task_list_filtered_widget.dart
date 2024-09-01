import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/core/enum/filter_enum.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/presentation/home/state/filter_state_notifier.dart';
import 'package:task_manager_app/presentation/home/widget/task_list_item.dart';

/// A widget that displays a list of tasks filtered by the current filter state.
class TaskListFilteredWidget extends ConsumerWidget {
  final List<Task> data;
  const TaskListFilteredWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watches the current filter state from the provider.
    final filter = ref.watch(filterStateNotifierProvider);

    // Filters the list of tasks based on the current filter.
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

    // Sets the text suffix based on the current filter.
    final filterText = switch (filter) {
      FilterEnum.all => "",
      FilterEnum.completed => " complète",
      FilterEnum.uncompleted => " incomplète",
    };

    // Displays a message if no tasks match the filter criteria, otherwise shows a list of tasks.
    return filteredList.isEmpty
        ? Center(
            child: Text(
              "Aucune tâche$filterText",
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
