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

  @override
  String toString() {
    return '''
emailInputController: ${emailInputController},
keyLoginForm: ${keyLoginForm},
isObscure: ${isObscure}
    ''';
  }
}
