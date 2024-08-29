import 'package:task_manager_app/core/enum/operation_status.dart';

class OperationState {
  final String title;
  final String description;
  final bool isCompleted;
  final OperationStatus status;
  OperationState({
    this.title = '',
    this.description = '',
    this.isCompleted = false,
    this.status = OperationStatus.initial,
  });

  OperationState copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    OperationStatus? status,
  }) {
    return OperationState(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      status: status ?? this.status,
    );
  }

  bool get isFormValid => title.isNotEmpty && description.isNotEmpty;
  bool get isSubmitting => status == OperationStatus.submitting;
  bool get hasFailed => status == OperationStatus.failure;
}
