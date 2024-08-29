import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/presentation/home/state/task_list_state.dart';
import 'package:task_manager_app/presentation/home/widget/task_list_filtered_widget.dart';

class TaskListLayout extends ConsumerWidget {
  const TaskListLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsyncValue = ref.watch(taskListStateProvider);
    return switch (dataAsyncValue) {
      AsyncData(:final value) => TaskListFilteredWidget(
          data: value,
        ),
      AsyncError() => Center(
          child: Text(
            'Une erreur se produit lors du chargement des tâches',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.red),
          ),
        ),
      _ => const Center(
          child: CircularProgressIndicator(),
        ),
    };
  }
}
