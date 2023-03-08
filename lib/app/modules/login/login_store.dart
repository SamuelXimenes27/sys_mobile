import 'dart:developer';

import 'package:design_leveling/app/shared/constants/routes_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  TextEditingController emailInputController = TextEditingController();

  @observable
  TextEditingController passwordInputController = TextEditingController();

  @observable
  var keyLoginForm = GlobalKey<FormState>();

  @observable
  bool isObscure = true;

  @observable
  bool noUserFound = false;

  @observable
  bool wrongPassword = false;

  @action
  checkIsLogged(context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
        Navigator.pushReplacementNamed(context, RoutesConst.home);
      }
    });
  }

  @action
  makeLogin() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailInputController.text,
        password: passwordInputController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        noUserFound = true;
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        wrongPassword = true;
      }
    }
  }
}
