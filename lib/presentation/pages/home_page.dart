import 'package:flutter/material.dart';
import 'package:task_manager_app/presentation/widget/task_filter_widget.dart';
import 'package:task_manager_app/presentation/widget/task_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 5,
        title: const Text("Gestion des tâches"),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(5.0),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TaskFilterWidget(),
                  Divider(height: 2, color: Colors.grey),
                  SizedBox(
                    height: 10.0,
                  ),
                  TaskListWidget(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FilledButton(
                onPressed: () {},
                child: const Text("Ajouter une nouvelle tâche"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
