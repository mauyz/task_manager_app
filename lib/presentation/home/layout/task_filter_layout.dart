import 'package:flutter/material.dart';
import 'package:task_manager_app/core/enum/filter_enum.dart';
import 'package:task_manager_app/presentation/home/widget/task_filter_item.dart';
import 'package:task_manager_app/generated/l10n.dart' show S;

/// A widget that provides a layout for filtering the task list.
///
/// [TaskFilterLayout] displays a set of filter options that allow users to filter tasks based on
/// their status.
class TaskFilterLayout extends StatelessWidget {
  const TaskFilterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                S.current.filterTaskList,
              ),
            ),
            Row(
              children: [
                TaskFilterItem(
                  title: S.of(context).all,
                  filter: FilterEnum.all,
                ),
                TaskFilterItem(
                  title: S.of(context).inProgress,
                  filter: FilterEnum.uncompleted,
                ),
                TaskFilterItem(
                  title: S.of(context).completed,
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
