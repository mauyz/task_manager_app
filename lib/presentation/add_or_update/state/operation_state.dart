import 'package:task_manager_app/core/enum/operation_status.dart';

/// Represents the state of an operation related to task creation or updating.
///
/// [OperationState] holds information about the current status of an operation,
/// including the form's data and the operation's status.
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

  /// Creates a new [OperationState] instance with the specified changes.
  /// Allows for immutability and updates to specific fields.
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
