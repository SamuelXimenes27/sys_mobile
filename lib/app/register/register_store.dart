import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  @observable
  TextEditingController emailInputController = TextEditingController();

  @observable
  TextEditingController passwordInputController = TextEditingController();

  @observable
  TextEditingController confirmPasswordInputController =
      TextEditingController();

  @observable
  var keyRegisterForm = GlobalKey<FormState>();

  @observable
  bool isObscure = true;
}
