import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:task_manager_app/app/app.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/description_field_form.dart';
import 'package:task_manager_app/presentation/add_or_update/widget/title_field_form.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("integration test", () {
    testWidgets("verify all action scenario", (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: App(),
        ),
      );

      /// verify if the circular progress is present
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.text("Aucune tâche"), findsOneWidget);

      await tester.pump(const Duration(seconds: 2));

      /// add 3 tasks scenario
      await addNewTask(tester, "Tâche 1", "Description de la tâche 1");
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await addNewTask(tester, "Tâche 2", "Description de la tâche 2");
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await addNewTask(tester, "Tâche", "Description de la tâche");

      await tester.pumpAndSettle(const Duration(seconds: 3));

      /// change task's state scenario
      await changeTaskState(tester);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      /// filter list scenario
      await filterList(tester);

      /// update task scenario
      await updateTask(tester);

      await tester.pumpAndSettle(const Duration(seconds: 3));

      /// delete task scenario
      await deleteTask(tester);
      await tester.pumpAndSettle(const Duration(seconds: 3));
    });
  });
}

/// add new task test
Future addNewTask(WidgetTester tester, String title, String description) async {
  final addNewTaskButtonFinder = find.widgetWithText(
    FilledButton,
    "Ajouter une nouvelle tâche",
  );
  expect(addNewTaskButtonFinder, findsOneWidget);

  await tester.tap(addNewTaskButtonFinder);
  await tester.pumpAndSettle();

  final addTaskButtonFinder = find.widgetWithText(
    FilledButton,
    "Ajouter",
  );
  expect(addTaskButtonFinder, findsOneWidget);

  /// verify if the add button is not yet clickable
  expect(
    (tester.widget(addTaskButtonFinder) as FilledButton).onPressed,
    isNull,
  );

  /// fill the form text field

  final titleFieldFinder = find.byType(TitleFieldForm);
  await tester.enterText(titleFieldFinder, title);
  await tester.pump();

  final descFieldFinder = find.byType(DescriptionFieldForm);
  await tester.enterText(descFieldFinder, description);
  await tester.pump();

  /// close keyboard
  FocusScope.of(tester.element(descFieldFinder)).unfocus();
  await tester.pumpAndSettle(const Duration(seconds: 2));

  /// verify if the add button is clickable
  expect(
    (tester.widget(addTaskButtonFinder) as FilledButton).onPressed,
    isNotNull,
  );
  await tester.pumpAndSettle(const Duration(seconds: 2));

  await tester.tap(addTaskButtonFinder);
  await tester.pumpAndSettle(const Duration(seconds: 2));

  /// verify if the new task is displayed
  expect(find.text(title), findsOneWidget);
}

/// change task's state test
Future changeTaskState(WidgetTester tester) async {
  final completedTaskFinder = find.widgetWithIcon(
    IconButton,
    Icons.check_box_outline_blank_rounded,
  );
  expect(completedTaskFinder, findsWidgets);

  await tester.tap(completedTaskFinder.at(0));
  await tester.pumpAndSettle();

  expect(
    find.widgetWithIcon(
      IconButton,
      Icons.check_box_rounded,
    ),
    findsOneWidget,
  );
}

/// filter the list test
Future filterList(WidgetTester tester) async {
  /// verify the filters buttons are present
  final allFilter = find.widgetWithText(TextButton, "Toutes");
  final uncompletedFilter = find.widgetWithText(TextButton, "En cours");
  final completedFilter = find.widgetWithText(TextButton, "Complètes");

  expect(allFilter, findsOneWidget);
  expect(uncompletedFilter, findsOneWidget);
  expect(completedFilter, findsOneWidget);

  /// tap on uncompleted filter
  await tester.tap(uncompletedFilter);
  await tester.pumpAndSettle();

  /// verify that the list shows only the uncompleted element
  expect(find.text("Tâche 1"), findsNothing);
  expect(find.text("Tâche 2"), findsOneWidget);
  expect(find.text("Tâche"), findsOneWidget);

  await tester.pumpAndSettle(const Duration(seconds: 2));

  /// tap on completed filter
  await tester.tap(completedFilter);
  await tester.pumpAndSettle();

  /// verify that the list shows only the completed element
  expect(find.text("Tâche 1"), findsOneWidget);
  expect(find.text("Tâche 2"), findsNothing);
  expect(find.text("Tâche"), findsNothing);

  await tester.pumpAndSettle(const Duration(seconds: 2));

  await tester.tap(allFilter);
  await tester.pumpAndSettle(const Duration(seconds: 2));
}

/// update task test
Future updateTask(WidgetTester tester) async {
  final lastItemFinder = find.widgetWithText(InkWell, "Tâche");
  expect(lastItemFinder, findsOneWidget);

  await tester.tap(lastItemFinder);
  await tester.pumpAndSettle();

  /// verify if the update button is not yet clickable
  final updateTaskButtonFinder = find.widgetWithText(
    FilledButton,
    "Modifier",
  );
  expect(updateTaskButtonFinder, findsOneWidget);
  expect(
    (tester.widget(updateTaskButtonFinder) as FilledButton).onPressed,
    isNull,
  );

  await tester.pumpAndSettle(const Duration(seconds: 2));

  final updateTitleFieldFinder = find.byType(TitleFieldForm);
  await tester.enterText(updateTitleFieldFinder, "Tâche 3");
  await tester.pump();

  final updateStatusFinder = find.text("Complète");
  await tester.tap(updateStatusFinder);

  final updateDescFieldFinder = find.byType(DescriptionFieldForm);
  await tester.enterText(updateDescFieldFinder, "Description de la tâche 3");
  await tester.pump();

  /// close keyboard
  FocusScope.of(tester.element(updateDescFieldFinder)).unfocus();

  await tester.pumpAndSettle(const Duration(seconds: 2));

  /// verify if the update button is clickable
  expect(
    (tester.widget(updateTaskButtonFinder) as FilledButton).onPressed,
    isNotNull,
  );

  await tester.pumpAndSettle(const Duration(seconds: 3));

  await tester.tap(updateTaskButtonFinder);
  await tester.pumpAndSettle();

  expect(find.text("Tâche"), findsNothing);
  expect(find.text("Tâche 3"), findsOneWidget);
  expect(find.text("Description de la tâche 3"), findsOneWidget);
}

/// delete task test
Future deleteTask(WidgetTester tester) async {
  final deleteButtonsFinder = find.widgetWithIcon(
    IconButton,
    Icons.delete,
  );
  expect(deleteButtonsFinder, findsWidgets);

  /// tap on the delete button
  await tester.tap(deleteButtonsFinder.at(2));
  await tester.pump(const Duration(seconds: 3));

  final confirmButtonFinder = find.widgetWithText(TextButton, "Oui");
  expect(confirmButtonFinder, findsOneWidget);

  /// tap on the confirm button
  await tester.tap(confirmButtonFinder);
  await tester.pumpAndSettle();

  /// verify if the last element is not present
  expect(find.text("Tâche 3"), findsNothing);
}
