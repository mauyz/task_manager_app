import 'package:flutter/material.dart';
import 'package:task_manager_app/presentation/add_or_update/add_or_update_task_page.dart';
import 'package:task_manager_app/presentation/home/widget/simple_app_bar.dart';
import 'package:task_manager_app/presentation/home/widget/task_filter_layout.dart';
import 'package:task_manager_app/presentation/home/widget/task_list_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(
        title: Text("Gestion des tâches"),
      ),
      body: Stack(
        children: [
          const Positioned.fill(
            bottom: 50.0,
            child: Column(
              children: [
                TaskFilterLayout(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TaskListLayout(),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const AddOrUpdateTaskPage();
                      },
                    ),
                  );
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
