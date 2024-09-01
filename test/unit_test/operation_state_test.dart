import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_app/presentation/add_or_update/state/operation_state.dart';
import 'package:task_manager_app/core/enum/operation_status.dart';

void main() {
  group('OperationState', () {
    test('copyWith method, verify updated values', () {
      final initialState = OperationState(
        title: 'Old Title',
        description: 'Old Description',
        isCompleted: false,
        status: OperationStatus.initial,
      );

      final updatedState = initialState.copyWith(
        title: 'New Title',
        description: 'New Description',
        isCompleted: true,
        status: OperationStatus.success,
      );

      expect(updatedState.title, 'New Title');
      expect(updatedState.description, 'New Description');
      expect(updatedState.isCompleted, true);
      expect(updatedState.status, OperationStatus.success);
    });

    test('isFormValid returns true when title and description are not empty', () {
      final state = OperationState(
        title: 'Title',
        description: 'Description',
      );

      expect(state.isFormValid, true);
    });

    test('isFormValid returns false when title or description are empty', () {
      final stateWithEmptyTitle = OperationState(
        title: '',
        description: 'Description',
      );

      final stateWithEmptyDescription = OperationState(
        title: 'Title',
        description: '',
      );

      expect(stateWithEmptyTitle.isFormValid, false);
      expect(stateWithEmptyDescription.isFormValid, false);
    });

    test('isSubmitting returns true when status is submitting', () {
      final state = OperationState(
        status: OperationStatus.submitting,
      );

      expect(state.isSubmitting, true);
    });

    test('hasFailed returns true when status is failure', () {
      final state = OperationState(
        status: OperationStatus.failure,
      );

      expect(state.hasFailed, true);
    });
  });
}