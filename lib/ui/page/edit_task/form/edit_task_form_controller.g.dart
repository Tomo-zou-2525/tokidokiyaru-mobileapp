// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_task_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editTaskFormControllerHash() =>
    r'9e6b530b55f904e8001e38eec94cb02e44ee2ac1';

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

abstract class _$EditTaskFormController
    extends BuildlessAutoDisposeNotifier<TaskForm> {
  late final Task task;

  TaskForm build(
    Task task,
  );
}

/// See also [EditTaskFormController].
@ProviderFor(EditTaskFormController)
const editTaskFormControllerProvider = EditTaskFormControllerFamily();

/// See also [EditTaskFormController].
class EditTaskFormControllerFamily extends Family<TaskForm> {
  /// See also [EditTaskFormController].
  const EditTaskFormControllerFamily();

  /// See also [EditTaskFormController].
  EditTaskFormControllerProvider call(
    Task task,
  ) {
    return EditTaskFormControllerProvider(
      task,
    );
  }

  @override
  EditTaskFormControllerProvider getProviderOverride(
    covariant EditTaskFormControllerProvider provider,
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
  String? get name => r'editTaskFormControllerProvider';
}

/// See also [EditTaskFormController].
class EditTaskFormControllerProvider
    extends AutoDisposeNotifierProviderImpl<EditTaskFormController, TaskForm> {
  /// See also [EditTaskFormController].
  EditTaskFormControllerProvider(
    Task task,
  ) : this._internal(
          () => EditTaskFormController()..task = task,
          from: editTaskFormControllerProvider,
          name: r'editTaskFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editTaskFormControllerHash,
          dependencies: EditTaskFormControllerFamily._dependencies,
          allTransitiveDependencies:
              EditTaskFormControllerFamily._allTransitiveDependencies,
          task: task,
        );

  EditTaskFormControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.task,
  }) : super.internal();

  final Task task;

  @override
  TaskForm runNotifierBuild(
    covariant EditTaskFormController notifier,
  ) {
    return notifier.build(
      task,
    );
  }

  @override
  Override overrideWith(EditTaskFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: EditTaskFormControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<EditTaskFormController, TaskForm>
      createElement() {
    return _EditTaskFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditTaskFormControllerProvider && other.task == task;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, task.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditTaskFormControllerRef on AutoDisposeNotifierProviderRef<TaskForm> {
  /// The parameter `task` of this provider.
  Task get task;
}

class _EditTaskFormControllerProviderElement
    extends AutoDisposeNotifierProviderElement<EditTaskFormController, TaskForm>
    with EditTaskFormControllerRef {
  _EditTaskFormControllerProviderElement(super.provider);

  @override
  Task get task => (origin as EditTaskFormControllerProvider).task;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
