import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

// ignore: library_private_types_in_public_api
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

  @observable
  bool isWeakPassword = false;

  @observable
  bool emailAlreadyUsed = false;

  @action
  createAccount() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailInputController.text,
        password: passwordInputController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        isWeakPassword = true;
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        emailAlreadyUsed = true;
      }
    } catch (e) {
      print(e);
    }
  }
}
