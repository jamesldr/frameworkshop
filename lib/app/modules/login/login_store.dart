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
}
