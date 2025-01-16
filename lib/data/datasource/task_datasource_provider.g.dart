// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskDatabaseHash() => r'7013f34080a9332b4c90206399577a1e8ed9d03b';

/// This provider is responsible for instantiating and providing the [TaskDatasourceImpl]
/// instance, which handles the data operations for tasks in the app.
///
/// Copied from [taskDatabase].
@ProviderFor(taskDatabase)
final taskDatabaseProvider = AutoDisposeProvider<TaskDatasource>.internal(
  taskDatabase,
  name: r'taskDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskDatabaseRef = AutoDisposeProviderRef<TaskDatasource>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
