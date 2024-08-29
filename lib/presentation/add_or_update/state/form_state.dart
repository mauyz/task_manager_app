import 'package:task_manager_app/core/enum/form_status.dart';

class FormState {
  final String title;
  final String description;
  final bool isCompleted;
  final FormStatus status;
  FormState({
    this.title = '',
    this.description = '',
    this.isCompleted = false,
    this.status = FormStatus.initial,
  });

  FormState copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    FormStatus? status,
  }) {
    return FormState(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      status: status ?? this.status,
    );
  }

  bool get isValid => title.isNotEmpty && description.isNotEmpty;
  bool get isSubmitting => status == FormStatus.submitting;
  bool get hasFailed => status == FormStatus.failure;
}
