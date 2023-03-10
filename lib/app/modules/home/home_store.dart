import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../shared/constants/routes_const.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int selectedIndex = 0;

  @observable
  late TabController tabController;

  @action
  checkIsLogged(context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
        Navigator.pushReplacementNamed(context, RoutesConst.login);
      } else {
        log('User is signed in!');
      }
    });
  }
}
