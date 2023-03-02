import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
