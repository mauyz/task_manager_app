// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addTask": MessageLookupByLibrary.simpleMessage("Add new task"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "appTitle": MessageLookupByLibrary.simpleMessage("Task manager"),
        "completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "descRequired":
            MessageLookupByLibrary.simpleMessage("The description is required"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "enterTheDescription":
            MessageLookupByLibrary.simpleMessage("Enter the description"),
        "enterTheTitle":
            MessageLookupByLibrary.simpleMessage("Enter the title"),
        "errorOccurred": MessageLookupByLibrary.simpleMessage(
            "An error occurs when loading data"),
        "filterTaskList":
            MessageLookupByLibrary.simpleMessage("Filter the list"),
        "inProgress": MessageLookupByLibrary.simpleMessage("In progress"),
        "noTask": MessageLookupByLibrary.simpleMessage("No task"),
        "noText": MessageLookupByLibrary.simpleMessage("No"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "taskAdded": MessageLookupByLibrary.simpleMessage("Task added"),
        "taskDeleted": MessageLookupByLibrary.simpleMessage("Task deleted"),
        "taskDeletionConfirm": MessageLookupByLibrary.simpleMessage(
            "Do you want to delete the task"),
        "taskUpdated": MessageLookupByLibrary.simpleMessage("Task updated"),
        "title": MessageLookupByLibrary.simpleMessage("Title"),
        "titleRequired":
            MessageLookupByLibrary.simpleMessage("The title is required"),
        "update": MessageLookupByLibrary.simpleMessage("Update"),
        "updateTask": MessageLookupByLibrary.simpleMessage("Update a task"),
        "yesText": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
