// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  late final _$emailInputControllerAtom =
      Atom(name: '_LoginStoreBase.emailInputController', context: context);

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

  late final _$passwordInputControllerAtom =
      Atom(name: '_LoginStoreBase.passwordInputController', context: context);

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

  late final _$keyLoginFormAtom =
      Atom(name: '_LoginStoreBase.keyLoginForm', context: context);

  @override
  GlobalKey<FormState> get keyLoginForm {
    _$keyLoginFormAtom.reportRead();
    return super.keyLoginForm;
  }

  @override
  set keyLoginForm(GlobalKey<FormState> value) {
    _$keyLoginFormAtom.reportWrite(value, super.keyLoginForm, () {
      super.keyLoginForm = value;
    });
  }

  late final _$isObscureAtom =
      Atom(name: '_LoginStoreBase.isObscure', context: context);

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

  late final _$noUserFoundAtom =
      Atom(name: '_LoginStoreBase.noUserFound', context: context);

  @override
  bool get noUserFound {
    _$noUserFoundAtom.reportRead();
    return super.noUserFound;
  }

  @override
  set noUserFound(bool value) {
    _$noUserFoundAtom.reportWrite(value, super.noUserFound, () {
      super.noUserFound = value;
    });
  }

  late final _$wrongPasswordAtom =
      Atom(name: '_LoginStoreBase.wrongPassword', context: context);

  @override
  bool get wrongPassword {
    _$wrongPasswordAtom.reportRead();
    return super.wrongPassword;
  }

  @override
  set wrongPassword(bool value) {
    _$wrongPasswordAtom.reportWrite(value, super.wrongPassword, () {
      super.wrongPassword = value;
    });
  }

  late final _$makeLoginAsyncAction =
      AsyncAction('_LoginStoreBase.makeLogin', context: context);

  @override
  Future makeLogin() {
    return _$makeLoginAsyncAction.run(() => super.makeLogin());
  }

  late final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase', context: context);

  @override
  dynamic checkIsLogged(dynamic context) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.checkIsLogged');
    try {
      return super.checkIsLogged(context);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailInputController: ${emailInputController},
passwordInputController: ${passwordInputController},
keyLoginForm: ${keyLoginForm},
isObscure: ${isObscure},
noUserFound: ${noUserFound},
wrongPassword: ${wrongPassword}
    ''';
  }
}
