import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reactive_forms/reactive_forms.dart';

class _FormGroupHookCreator<T> {
  const _FormGroupHookCreator();

  FormGroup call(
    Map<String, AbstractControl<T>> controls, {
    List<Validator<dynamic>> validators = const [],
    List<AsyncValidator<dynamic>> asyncValidators = const [],
    int asyncValidatorsDebounceTime = 250,
    bool disabled = false,
  }) {
    return use(_FormGroupHook<T>(
      controls,
      validators: validators,
      asyncValidators: asyncValidators,
      asyncValidatorsDebounceTime: asyncValidatorsDebounceTime,
      disabled: disabled,
    ));
  }
}

const useFormGroup = _FormGroupHookCreator<String>();

class _FormGroupHook<T> extends Hook<FormGroup> {
  const _FormGroupHook(
    this.controls, {
    this.validators = const [],
    this.asyncValidators = const [],
    this.asyncValidatorsDebounceTime = 250,
    this.disabled = false,
    super.keys,
  });

  final Map<String, AbstractControl<T>> controls;
  final List<Validator<dynamic>> validators;
  final List<AsyncValidator<dynamic>> asyncValidators;
  final int asyncValidatorsDebounceTime;
  final bool disabled;

  @override
  _FormGroupHookState<String> createState() {
    return _FormGroupHookState();
  }
}

class _FormGroupHookState<T> extends HookState<FormGroup, _FormGroupHook> {
  late final _group = FormGroup(
    hook.controls,
    asyncValidators: hook.asyncValidators,
    asyncValidatorsDebounceTime: hook.asyncValidatorsDebounceTime,
    disabled: hook.disabled,
    validators: hook.validators,
  );

  @override
  FormGroup build(BuildContext context) => _group;

  @override
  void dispose() => _group.dispose();

  @override
  String get debugLabel => 'useFormGroup';
}
