import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String? user;
  @action
  userOnChanged(String? value) => user = value;

  @observable
  String? password;
  @action
  passwordOnChanged(String? value) => password = value;

  @observable
  bool pwVisibile = false;
  @action
  togglePwVisibile() => pwVisibile = !pwVisibile;

  @observable
  bool isBusy = false;
  @action
  toggleBusy() => isBusy = !isBusy;

  @action
  onLogin() {
    if (isBusy) {
      return;
    } else {
      toggleBusy();
    }
    Modular.to.navigate('/feed');
    toggleBusy();
  }
}
