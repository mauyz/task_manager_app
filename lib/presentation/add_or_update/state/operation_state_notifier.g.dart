// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$operationStateNotifierHash() =>
    r'e9b08a2214fa40b73032e1b4f4e0de7023d56406';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$OperationStateNotifier
    extends BuildlessAutoDisposeNotifier<OperationState> {
  late final Task? task;

  OperationState build(
    Task? task,
  );
}

/// Manages the state for adding or updating a task.
///
/// [OperationStateNotifier] handles the state related to task operations, including
/// form data and the operation's status. It provides methods to update form fields and
/// submit the form data, which can be either for adding a new task or updating an existing one.
///
/// Copied from [OperationStateNotifier].
@ProviderFor(OperationStateNotifier)
const operationStateNotifierProvider = OperationStateNotifierFamily();

/// Manages the state for adding or updating a task.
///
/// [OperationStateNotifier] handles the state related to task operations, including
/// form data and the operation's status. It provides methods to update form fields and
/// submit the form data, which can be either for adding a new task or updating an existing one.
///
/// Copied from [OperationStateNotifier].
class OperationStateNotifierFamily extends Family<OperationState> {
  /// Manages the state for adding or updating a task.
  ///
  /// [OperationStateNotifier] handles the state related to task operations, including
  /// form data and the operation's status. It provides methods to update form fields and
  /// submit the form data, which can be either for adding a new task or updating an existing one.
  ///
  /// Copied from [OperationStateNotifier].
  const OperationStateNotifierFamily();

  /// Manages the state for adding or updating a task.
  ///
  /// [OperationStateNotifier] handles the state related to task operations, including
  /// form data and the operation's status. It provides methods to update form fields and
  /// submit the form data, which can be either for adding a new task or updating an existing one.
  ///
  /// Copied from [OperationStateNotifier].
  OperationStateNotifierProvider call(
    Task? task,
  ) {
    return OperationStateNotifierProvider(
      task,
    );
  }

  @override
  OperationStateNotifierProvider getProviderOverride(
    covariant OperationStateNotifierProvider provider,
  ) {
    return call(
      provider.task,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'operationStateNotifierProvider';
}

/// Manages the state for adding or updating a task.
///
/// [OperationStateNotifier] handles the state related to task operations, including
/// form data and the operation's status. It provides methods to update form fields and
/// submit the form data, which can be either for adding a new task or updating an existing one.
///
/// Copied from [OperationStateNotifier].
class OperationStateNotifierProvider extends AutoDisposeNotifierProviderImpl<
    OperationStateNotifier, OperationState> {
  /// Manages the state for adding or updating a task.
  ///
  /// [OperationStateNotifier] handles the state related to task operations, including
  /// form data and the operation's status. It provides methods to update form fields and
  /// submit the form data, which can be either for adding a new task or updating an existing one.
  ///
  /// Copied from [OperationStateNotifier].
  OperationStateNotifierProvider(
    Task? task,
  ) : this._internal(
          () => OperationStateNotifier()..task = task,
          from: operationStateNotifierProvider,
          name: r'operationStateNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$operationStateNotifierHash,
          dependencies: OperationStateNotifierFamily._dependencies,
          allTransitiveDependencies:
              OperationStateNotifierFamily._allTransitiveDependencies,
          task: task,
        );

  OperationStateNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.task,
  }) : super.internal();

  final Task? task;

  @override
  OperationState runNotifierBuild(
    covariant OperationStateNotifier notifier,
  ) {
    return notifier.build(
      task,
    );
  }

  @override
  Override overrideWith(OperationStateNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: OperationStateNotifierProvider._internal(
        () => create()..task = task,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        task: task,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<OperationStateNotifier, OperationState>
      createElement() {
    return _OperationStateNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OperationStateNotifierProvider && other.task == task;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, task.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OperationStateNotifierRef
    on AutoDisposeNotifierProviderRef<OperationState> {
  /// The parameter `task` of this provider.
  Task? get task;
}

class _OperationStateNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<OperationStateNotifier,
        OperationState> with OperationStateNotifierRef {
  _OperationStateNotifierProviderElement(super.provider);

  @override
  Task? get task => (origin as OperationStateNotifierProvider).task;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
