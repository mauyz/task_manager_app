import 'package:flutter/material.dart';
import 'package:task_manager_app/core/enum/filter_enum.dart';
import 'package:task_manager_app/presentation/home/widget/task_filter_item.dart';

class TaskFilterLayout extends StatelessWidget {
  const TaskFilterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Filtrer la liste",
              ),
            ),
            Row(
              children: [
                TaskFilterItem(
                  title: "Toutes",
                  filter: FilterEnum.all,
                ),
                TaskFilterItem(
                  title: "En cours",
                  filter: FilterEnum.uncompleted,
                ),
                TaskFilterItem(
                  title: "Complètes",
                  filter: FilterEnum.completed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
