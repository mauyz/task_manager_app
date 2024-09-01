import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/core/enum/filter_enum.dart';
import 'package:task_manager_app/presentation/home/state/filter_state_notifier.dart';

/// A widget representing a filter item.
///
/// [TaskFilterItem] is a customizable button used to select a specific filter
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
    final filterActive = ref.watch(filterStateNotifierProvider);
    final selected = filter == filterActive;
    return Flexible(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor:
              selected ? Theme.of(context).colorScheme.primaryContainer : null,
          shape: ContinuousRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ),
        onPressed: () {
          if (filterActive != filter) {
            ref.read(filterStateNotifierProvider.notifier).update(filter);
          }
        },
        child: Text(title),
      ),
    );
  }
}
