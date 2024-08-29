// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_state_notifier_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formStateNotifierHash() => r'3b439c5643d6054789d48a14c57dd41307b68f9f';

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

abstract class _$FormStateNotifier
    extends BuildlessAutoDisposeNotifier<FormState> {
  late final Task? task;

  FormState build(
    Task? task,
  );
}

/// See also [FormStateNotifier].
@ProviderFor(FormStateNotifier)
const formStateNotifierProvider = FormStateNotifierFamily();

/// See also [FormStateNotifier].
class FormStateNotifierFamily extends Family<FormState> {
  /// See also [FormStateNotifier].
  const FormStateNotifierFamily();

  /// See also [FormStateNotifier].
  FormStateNotifierProvider call(
    Task? task,
  ) {
    return FormStateNotifierProvider(
      task,
    );
  }

  @override
  FormStateNotifierProvider getProviderOverride(
    covariant FormStateNotifierProvider provider,
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
  String? get name => r'formStateNotifierProvider';
}

/// See also [FormStateNotifier].
class FormStateNotifierProvider
    extends AutoDisposeNotifierProviderImpl<FormStateNotifier, FormState> {
  /// See also [FormStateNotifier].
  FormStateNotifierProvider(
    Task? task,
  ) : this._internal(
          () => FormStateNotifier()..task = task,
          from: formStateNotifierProvider,
          name: r'formStateNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formStateNotifierHash,
          dependencies: FormStateNotifierFamily._dependencies,
          allTransitiveDependencies:
              FormStateNotifierFamily._allTransitiveDependencies,
          task: task,
        );

  FormStateNotifierProvider._internal(
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
  FormState runNotifierBuild(
    covariant FormStateNotifier notifier,
  ) {
    return notifier.build(
      task,
    );
  }

  @override
  Override overrideWith(FormStateNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: FormStateNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<FormStateNotifier, FormState>
      createElement() {
    return _FormStateNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormStateNotifierProvider && other.task == task;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, task.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormStateNotifierRef on AutoDisposeNotifierProviderRef<FormState> {
  /// The parameter `task` of this provider.
  Task? get task;
}

class _FormStateNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<FormStateNotifier, FormState>
    with FormStateNotifierRef {
  _FormStateNotifierProviderElement(super.provider);

  @override
  Task? get task => (origin as FormStateNotifierProvider).task;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
