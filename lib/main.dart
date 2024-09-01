import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/app/app.dart';

void main() {
  // The entry point of the application.
  // This sets up the application with Riverpod's ProviderScope
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
