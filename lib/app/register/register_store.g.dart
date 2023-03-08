// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStoreBase, Store {
  late final _$emailInputControllerAtom =
      Atom(name: '_RegisterStoreBase.emailInputController', context: context);

  @override
  TextEditingController get emailInputController {
    _$emailInputControllerAtom.reportRead();
    return super.emailInputController;
  }

  @override
  set emailInputController(TextEditingController value) {
    _$emailInputControllerAtom.reportWrite(value, super.emailInputController,
        () {
      super.emailInputController = value;
    });
  }

  late final _$passwordInputControllerAtom = Atom(
      name: '_RegisterStoreBase.passwordInputController', context: context);

  @override
  TextEditingController get passwordInputController {
    _$passwordInputControllerAtom.reportRead();
    return super.passwordInputController;
  }

  @override
  set passwordInputController(TextEditingController value) {
    _$passwordInputControllerAtom
        .reportWrite(value, super.passwordInputController, () {
      super.passwordInputController = value;
    });
  }

  late final _$confirmPasswordInputControllerAtom = Atom(
      name: '_RegisterStoreBase.confirmPasswordInputController',
      context: context);

  @override
  TextEditingController get confirmPasswordInputController {
    _$confirmPasswordInputControllerAtom.reportRead();
    return super.confirmPasswordInputController;
  }

  @override
  set confirmPasswordInputController(TextEditingController value) {
    _$confirmPasswordInputControllerAtom
        .reportWrite(value, super.confirmPasswordInputController, () {
      super.confirmPasswordInputController = value;
    });
  }

  late final _$keyRegisterFormAtom =
      Atom(name: '_RegisterStoreBase.keyRegisterForm', context: context);

  @override
  GlobalKey<FormState> get keyRegisterForm {
    _$keyRegisterFormAtom.reportRead();
    return super.keyRegisterForm;
  }

  @override
  set keyRegisterForm(GlobalKey<FormState> value) {
    _$keyRegisterFormAtom.reportWrite(value, super.keyRegisterForm, () {
      super.keyRegisterForm = value;
    });
  }

  late final _$isObscureAtom =
      Atom(name: '_RegisterStoreBase.isObscure', context: context);

  @override
  bool get isObscure {
    _$isObscureAtom.reportRead();
    return super.isObscure;
  }

  @override
  set isObscure(bool value) {
    _$isObscureAtom.reportWrite(value, super.isObscure, () {
      super.isObscure = value;
    });
  }

  @override
  String toString() {
    return '''
emailInputController: ${emailInputController},
passwordInputController: ${passwordInputController},
confirmPasswordInputController: ${confirmPasswordInputController},
keyRegisterForm: ${keyRegisterForm},
isObscure: ${isObscure}
    ''';
  }
}
