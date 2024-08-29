import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/core/enum/form_status.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/description_field_form.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/field_title_widget.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/status_field_form.dart';
import 'package:task_manager_app/presentation/home/widget/error_text_widget.dart';
import 'package:task_manager_app/presentation/home/widget/simple_app_bar.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/submit_button.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/title_field_form.dart';
import 'package:task_manager_app/presentation/add_or_update/state/form_state_notifier_provider.dart';

class AddOrUpdateTaskPage extends ConsumerWidget {
  final Task? task;
  const AddOrUpdateTaskPage({
    super.key,
    this.task,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(formStateNotifierProvider(task));
    final formStateNotifier =
        ref.read(formStateNotifierProvider(task).notifier);
    ref.listen(
      formStateNotifierProvider(task),
      (previous, next) {
        if (previous?.isSubmitting == true &&
            next.status == FormStatus.success) {
          if (context.mounted) {
            Navigator.of(context).pop();
          }
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
                      initialValue: formState.title,
                      onChanged: formStateNotifier.updateTitle,
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
                              selected: !formState.isCompleted,
                              text: "En cours",
                              onSelect: () {
                                if (formState.isCompleted) {
                                  formStateNotifier.updateIsCompleted(false);
                                }
                              },
                            ),
                          ),
                          Flexible(
                            child: StatusFieldForm(
                              selected: formState.isCompleted,
                              text: "Complète",
                              onSelect: () {
                                if (!formState.isCompleted) {
                                  formStateNotifier.updateIsCompleted(true);
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
                      initialValue: formState.description,
                      onChanged: formStateNotifier.updateDescription,
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
                if (formState.status == FormStatus.failure)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ErrorTextWidget(
                      text: "Une erreur s'est produite pendant l'opération",
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: formState.status == FormStatus.submitting
                      ? const CircularProgressIndicator()
                      : SubmitButton(
                          text: task == null ? "Ajouter" : "Modifier",
                          onSubmit: formState.isValid
                              ? () async {
                                  await formStateNotifier.submitForm();
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
}
