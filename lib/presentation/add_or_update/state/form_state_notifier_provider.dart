import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_manager_app/core/enum/form_status.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/presentation/add_or_update/state/form_state.dart';
import 'package:task_manager_app/presentation/home/state/task_list_state.dart';

part 'form_state_notifier_provider.g.dart';

@riverpod
class FormStateNotifier extends _$FormStateNotifier {
  @override
  FormState build(Task? task) {
    return task == null
        ? FormState()
        : FormState(
            title: task.title,
            description: task.description,
            isCompleted: task.isCompleted,
          );
  }

  void updateTitle(String title) {
    state = state.copyWith(
      title: title,
      status: FormStatus.initial,
    );
  }

  void updateDescription(String description) {
    state = state.copyWith(
      description: description,
      status: FormStatus.initial,
    );
  }

  void updateIsCompleted(bool isCompleted) {
    state = state.copyWith(
      isCompleted: isCompleted,
      status: FormStatus.initial,
    );
  }

  Future submitForm() async {
    state = state.copyWith(status: FormStatus.submitting);
    try {
      if (task == null) {
        final data = Task(
          id: 0,
          title: state.title,
          description: state.description,
          isCompleted: state.isCompleted,
        );
        await ref.read(taskListStateProvider.notifier).addTask(data);
      } else {
        final data = Task(
          id: task!.id,
          title: state.title,
          description: state.description,
          isCompleted: state.isCompleted,
        );
        await ref.read(taskListStateProvider.notifier).updateTask(data);
      }
      state = state.copyWith(status: FormStatus.success);
    } catch (_) {
      state = state.copyWith(status: FormStatus.failure);
    }
  }
}
