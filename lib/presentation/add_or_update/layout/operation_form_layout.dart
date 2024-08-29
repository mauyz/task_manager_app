import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/core/enum/operation_status.dart';
import 'package:task_manager_app/presentation/util/display_snack_bar.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/presentation/add_or_update/state/operation_state_notifier.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/description_field_form.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/field_title_widget.dart';
import 'package:task_manager_app/presentation/add_or_update/layout/status_form_layout.dart';
import 'package:task_manager_app/presentation/add_or_update/layout/submit_form_layout.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/title_field_form.dart';

class OperationFormLayout extends ConsumerWidget {
  final Task? task;
  const OperationFormLayout({
    super.key,
    this.task,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final operationState = ref.watch(operationStateNotifierProvider(task));
    final operationStateNotifier =
        ref.read(operationStateNotifierProvider(task).notifier);
    ref.listen(
      operationStateNotifierProvider(task),
      (previous, next) {
        if (previous?.isSubmitting == true &&
            next.status == OperationStatus.success) {
          Navigator.of(context).pop();
          displaySnackBar(
            context,
            task == null ? "Tâche ajoutée" : "Tâche modifiée",
          );
        }
      },
    );
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const FieldTitleWidget(text: "Titre :"),
                    TitleFieldForm(
                      initialValue: operationState.title,
                      onChanged: operationStateNotifier.updateTitle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (task != null) ...[
                      StatusFormLayout(
                        operationState: operationState,
                        operationStateNotifier: operationStateNotifier,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ] else
                      const SizedBox(
                        height: 10,
                      ),
                    const FieldTitleWidget(text: "Description :"),
                    DescriptionFieldForm(
                      initialValue: operationState.description,
                      onChanged: operationStateNotifier.updateDescription,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SubmitFormLayout(
                task: task,
                operationState: operationState,
                operationStateNotifier: operationStateNotifier,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
