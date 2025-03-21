// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Task manager`
  String get appTitle {
    return Intl.message(
      'Task manager',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add new task`
  String get addTask {
    return Intl.message(
      'Add new task',
      name: 'addTask',
      desc: '',
      args: [],
    );
  }

  /// `Filter the list`
  String get filterTaskList {
    return Intl.message(
      'Filter the list',
      name: 'filterTaskList',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `In progress`
  String get inProgress {
    return Intl.message(
      'In progress',
      name: 'inProgress',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `An error occurs when loading data`
  String get errorOccurred {
    return Intl.message(
      'An error occurs when loading data',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `No task`
  String get noTask {
    return Intl.message(
      'No task',
      name: 'noTask',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete the task`
  String get taskDeletionConfirm {
    return Intl.message(
      'Do you want to delete the task',
      name: 'taskDeletionConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Task deleted`
  String get taskDeleted {
    return Intl.message(
      'Task deleted',
      name: 'taskDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yesText {
    return Intl.message(
      'Yes',
      name: 'yesText',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get noText {
    return Intl.message(
      'No',
      name: 'noText',
      desc: '',
      args: [],
    );
  }

  /// `Update a task`
  String get updateTask {
    return Intl.message(
      'Update a task',
      name: 'updateTask',
      desc: '',
      args: [],
    );
  }

  /// `Enter the title`
  String get enterTheTitle {
    return Intl.message(
      'Enter the title',
      name: 'enterTheTitle',
      desc: '',
      args: [],
    );
  }

  /// `The title is required`
  String get titleRequired {
    return Intl.message(
      'The title is required',
      name: 'titleRequired',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Enter the description`
  String get enterTheDescription {
    return Intl.message(
      'Enter the description',
      name: 'enterTheDescription',
      desc: '',
      args: [],
    );
  }

  /// `The description is required`
  String get descRequired {
    return Intl.message(
      'The description is required',
      name: 'descRequired',
      desc: '',
      args: [],
    );
  }

  /// `Task added`
  String get taskAdded {
    return Intl.message(
      'Task added',
      name: 'taskAdded',
      desc: '',
      args: [],
    );
  }

  /// `Task updated`
  String get taskUpdated {
    return Intl.message(
      'Task updated',
      name: 'taskUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
