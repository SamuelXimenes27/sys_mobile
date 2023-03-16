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

  late final _$userNameInputControllerAtom = Atom(
      name: '_RegisterStoreBase.userNameInputController', context: context);

  @override
  TextEditingController get userNameInputController {
    _$userNameInputControllerAtom.reportRead();
    return super.userNameInputController;
  }

  @override
  set userNameInputController(TextEditingController value) {
    _$userNameInputControllerAtom
        .reportWrite(value, super.userNameInputController, () {
      super.userNameInputController = value;
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

  late final _$isWeakPasswordAtom =
      Atom(name: '_RegisterStoreBase.isWeakPassword', context: context);

  @override
  bool get isWeakPassword {
    _$isWeakPasswordAtom.reportRead();
    return super.isWeakPassword;
  }

  @override
  set isWeakPassword(bool value) {
    _$isWeakPasswordAtom.reportWrite(value, super.isWeakPassword, () {
      super.isWeakPassword = value;
    });
  }

  late final _$emailAlreadyUsedAtom =
      Atom(name: '_RegisterStoreBase.emailAlreadyUsed', context: context);

  @override
  bool get emailAlreadyUsed {
    _$emailAlreadyUsedAtom.reportRead();
    return super.emailAlreadyUsed;
  }

  @override
  set emailAlreadyUsed(bool value) {
    _$emailAlreadyUsedAtom.reportWrite(value, super.emailAlreadyUsed, () {
      super.emailAlreadyUsed = value;
    });
  }

  late final _$createAccountAsyncAction =
      AsyncAction('_RegisterStoreBase.createAccount', context: context);

  @override
  Future createAccount() {
    return _$createAccountAsyncAction.run(() => super.createAccount());
  }

  @override
  String toString() {
    return '''
emailInputController: ${emailInputController},
passwordInputController: ${passwordInputController},
userNameInputController: ${userNameInputController},
confirmPasswordInputController: ${confirmPasswordInputController},
keyRegisterForm: ${keyRegisterForm},
isObscure: ${isObscure},
isWeakPassword: ${isWeakPassword},
emailAlreadyUsed: ${emailAlreadyUsed}
    ''';
  }
}
