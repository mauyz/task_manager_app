import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/core/enum/filter_enum.dart';
import 'package:task_manager_app/presentation/home/state/task_filter_state.dart';

class TaskFilterItem extends ConsumerWidget {
  final String title;
  final FilterEnum filter;
  const TaskFilterItem({
    super.key,
    required this.title,
    required this.filter,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterActive = ref.watch(taskFilterStateProvider);
    final selected = filter == filterActive;
    return Flexible(
      child: TextButton(
        style: selected
            ? TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              )
            : null,
        onPressed: () {
          if (filterActive != filter) {
            ref.read(taskFilterStateProvider.notifier).update(filter);
          }
        },
        child: Text(title),
      ),
    );
  }
}
