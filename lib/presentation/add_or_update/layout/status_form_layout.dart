import 'package:flutter/material.dart';
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
        const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: FieldTitleWidget(
            text: "Status:",
          ),
        ),
        Flexible(
          child: StatusFieldForm(
            selected: !operationState.isCompleted,
            text: "En cours",
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
            text: "Complète",
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
