import 'package:flutter/material.dart';
import 'package:task_manager_app/generated/l10n.dart' show S;
import 'package:task_manager_app/presentation/add_or_update/state/operation_state.dart';
import 'package:task_manager_app/presentation/add_or_update/state/operation_state_notifier.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/field_title_widget.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/status_field_form.dart';

/// A layout for selecting the status of a task.
///
/// - The "En cours" status is selected if `operationState.isCompleted` is `false`.
/// - The "Complète" status is selected if `operationState.isCompleted` is `true`.

class StatusFormLayout extends StatelessWidget {
  final OperationState operationState;
  final OperationStateNotifier operationStateNotifier;
  const StatusFormLayout({
    super.key,
    required this.operationState,
    required this.operationStateNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: FieldTitleWidget(
            text: S.current.status,
          ),
        ),
        Flexible(
          child: StatusFieldForm(
            selected: !operationState.isCompleted,
            text: S.current.inProgress,
            onSelect: () {
              if (operationState.isCompleted) {
                operationStateNotifier.updateIsCompleted(false);
              }
            },
          ),
        ),
        Flexible(
          child: StatusFieldForm(
            selected: operationState.isCompleted,
            text: S.current.completed,
            onSelect: () {
              if (!operationState.isCompleted) {
                operationStateNotifier.updateIsCompleted(true);
              }
            },
          ),
        ),
      ],
    );
  }
}
