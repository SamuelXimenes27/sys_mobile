import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  TextEditingController emailInputController = TextEditingController();

  @observable
  var keyLoginForm = GlobalKey<FormState>();

  @observable
  bool isObscure = true;
}
