import 'package:flutter/material.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/presentation/add_or_update/state/operation_state.dart';
import 'package:task_manager_app/presentation/add_or_update/state/operation_state_notifier.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/submit_button.dart';
import 'package:task_manager_app/presentation/home/widget/error_text_widget.dart';

class SubmitFormLayout extends StatelessWidget {
  final Task? task;
  final OperationState operationState;
  final OperationStateNotifier operationStateNotifier;
  const SubmitFormLayout({
    super.key,
    this.task,
    required this.operationState,
    required this.operationStateNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (operationState.hasFailed)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ErrorTextWidget(
              text: "Une erreur s'est produite pendant l'opération",
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: operationState.isSubmitting
              ? const CircularProgressIndicator()
              : SubmitButton(
                  text: task == null ? "Ajouter" : "Modifier",
                  onSubmit: _isSubmissionValid(operationState)
                      ? () async {
                          await operationStateNotifier.submitData();
                        }
                      : null,
                ),
        ),
      ],
    );
  }

  bool _isSubmissionValid(OperationState state) {
    if (task == null) {
      return state.isFormValid;
    }
    return state.isFormValid &&
        (task?.title != state.title ||
            task?.description != state.description ||
            task?.isCompleted != state.isCompleted);
  }
}
