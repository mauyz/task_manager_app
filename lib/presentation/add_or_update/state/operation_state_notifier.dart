import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_manager_app/core/enum/operation_status.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/presentation/add_or_update/state/operation_state.dart';
import 'package:task_manager_app/presentation/home/state/task_list_state_notifier.dart';

part 'operation_state_notifier.g.dart';

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

  void updateTitle(String title) {
    state = state.copyWith(
      title: title,
      status: OperationStatus.initial,
    );
  }

  void updateDescription(String description) {
    state = state.copyWith(
      description: description,
      status: OperationStatus.initial,
    );
  }

  void updateIsCompleted(bool isCompleted) {
    state = state.copyWith(
      isCompleted: isCompleted,
      status: OperationStatus.initial,
    );
  }

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
