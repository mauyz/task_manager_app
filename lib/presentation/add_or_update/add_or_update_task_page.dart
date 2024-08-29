import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/core/enum/operation_status.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/presentation/add_or_update/state/operation_state.dart';
import 'package:task_manager_app/presentation/add_or_update/state/operation_state_notifier_provider.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/description_field_form.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/field_title_widget.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/status_field_form.dart';
import 'package:task_manager_app/presentation/home/widget/error_text_widget.dart';
import 'package:task_manager_app/presentation/home/widget/simple_app_bar.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/submit_button.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/title_field_form.dart';

class AddOrUpdateTaskPage extends ConsumerWidget {
  final Task? task;
  const AddOrUpdateTaskPage({
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
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Opération réussie",
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.all(8.0),
            ),
          );
        }
      },
    );
    return Scaffold(
      appBar: SimpleAppBar(
        title: Text(
          task == null ? "Ajouter une nouvelle tâche" : "Modifier une tâche",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      height: 20,
                    ),
                    if (task != null) ...[
                      Row(
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
                                  operationStateNotifier
                                      .updateIsCompleted(false);
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
                                  operationStateNotifier
                                      .updateIsCompleted(true);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (operationState.status == OperationStatus.failure)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ErrorTextWidget(
                      text: "Une erreur s'est produite pendant l'opération",
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: operationState.status == OperationStatus.submitting
                      ? const CircularProgressIndicator()
                      : SubmitButton(
                          text: task == null ? "Ajouter" : "Modifier",
                          onSubmit: operationState.isValid &&
                                  _isDataChanged(operationState)
                              ? () async {
                                  await operationStateNotifier.submitForm();
                                }
                              : null,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _isDataChanged(OperationState state) {
    if (task == null) {
      return true;
    }
    return task?.title != state.title ||
        task?.description != state.description ||
        task?.isCompleted != state.isCompleted;
  }
}
