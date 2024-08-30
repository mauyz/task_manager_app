import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/presentation/home/state/task_list_state_notifier.dart';
import 'package:task_manager_app/presentation/home/widget/error_text_widget.dart';
import 'package:task_manager_app/presentation/home/widget/task_list_filtered_widget.dart';

class TaskListLayout extends ConsumerWidget {
  const TaskListLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsyncValue = ref.watch(taskListStateNotifierProvider);
    return dataAsyncValue.when(
      data: (data) => TaskListFilteredWidget(
        data: data,
      ),
      error: (_, __) => const Center(
        child: ErrorTextWidget(
          text: 'Une erreur se produit lors du chargement des données',
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
