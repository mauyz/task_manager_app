import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/presentation/home/state/task_list_state.dart';
import 'package:task_manager_app/presentation/home/widget/task_filter_layout.dart';
import 'package:task_manager_app/presentation/home/widget/task_list_layout.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text("Gestion des tâches"),
      ),
      body: Stack(
        children: [
          const Positioned.fill(
            bottom: 50.0,
            child: Column(
              children: [
                TaskFilterLayout(),
                Divider(height: 2, color: Colors.grey),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: TaskListLayout(),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: FilledButton(
                onPressed: () {
                  ref.read(taskListStateProvider.notifier).testAddTask();
                    /// TODO
                },
                child: const Text("Ajouter une nouvelle tâche"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
