import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_manager_app/core/enum/operation_status.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/presentation/add_or_update/state/operation_state.dart';
import 'package:task_manager_app/presentation/home/state/task_list_state_notifier.dart';

part 'operation_state_notifier.g.dart';

/// Manages the state for adding or updating a task.
///
/// [OperationStateNotifier] handles the state related to task operations, including
/// form data and the operation's status. It provides methods to update form fields and
/// submit the form data, which can be either for adding a new task or updating an existing one.
@riverpod
class OperationStateNotifier extends _$OperationStateNotifier {
  @override
  OperationState build(Task? task) {
    return task == null
        ? OperationState()
        : OperationState(
            title: task.title,
            description: task.description,
            isCompleted: task.isCompleted,
          );
  }

  /// Updates the title in the state and resets the status to initial.
  void updateTitle(String title) {
    state = state.copyWith(
      title: title,
      status: OperationStatus.initial,
    );
  }

  /// Updates the description in the state and resets the status to initial.
  void updateDescription(String description) {
    state = state.copyWith(
      description: description,
      status: OperationStatus.initial,
    );
  }

  /// Updates the completion status in the state and resets the status to initial.
  void updateIsCompleted(bool isCompleted) {
    state = state.copyWith(
      isCompleted: isCompleted,
      status: OperationStatus.initial,
    );
  }

  /// Submits the form data to either add a new task or update an existing one.
  /// - Sets the status to submitting before making the request.
  /// - Updates the status to success if the request is successful.
  /// - Updates the status to failure if an error occurs.
  Future submitData() async {
    state = state.copyWith(status: OperationStatus.submitting);
    try {
      final data = Task(
        id: task == null ? 0 : task!.id,
        title: state.title,
        description: state.description,
        isCompleted: state.isCompleted,
      );
      if (task == null) {
        await ref.read(taskListStateNotifierProvider.notifier).addTask(data);
      } else {
        await ref.read(taskListStateNotifierProvider.notifier).updateTask(data);
      }
      state = state.copyWith(status: OperationStatus.success);
    } catch (_) {
      state = state.copyWith(status: OperationStatus.failure);
    }
  }
}
