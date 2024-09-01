import 'package:flutter/material.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/presentation/add_or_update/state/operation_state.dart';
import 'package:task_manager_app/presentation/add_or_update/state/operation_state_notifier.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/submit_button.dart';
import 'package:task_manager_app/presentation/home/widget/error_text_widget.dart';

/// A layout for handling form submission for adding or updating tasks.
///
/// The widget displays:
/// - An error message if the operation has failed.
/// - A [CircularProgressIndicator] while the form is being submitted.
/// - A [SubmitButton] that triggers form submission when clicked.
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

  /// Determines if the form submission is valid.
  ///
  /// For a new task, the form is valid if all required fields are filled.
  /// For an existing task, the form is valid if there are changes in the form data
  /// compared to the existing [task] data and the form is otherwise valid.
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
