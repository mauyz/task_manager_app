import 'package:flutter/material.dart';
import 'package:task_manager_app/core/enum/filter_enum.dart';
import 'package:task_manager_app/presentation/home/widget/task_filter_item.dart';

class TaskFilterLayout extends StatelessWidget {
  const TaskFilterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Filtrer la liste",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const Row(
              children: [
                TaskFilterItem(
                  title: "Toute",
                  filter: FilterEnum.all,
                ),
                SizedBox(
                  width: 10,
                ),
                TaskFilterItem(
                  title: "Complète",
                  filter: FilterEnum.completed,
                ),
                SizedBox(
                  width: 10,
                ),
                TaskFilterItem(
                  title: "En cours",
                  filter: FilterEnum.uncompleted,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
