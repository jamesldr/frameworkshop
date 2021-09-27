import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  @observable
  double totalPrice = 0;
  @action
  setTotalPrice(double value) => totalPrice = value;
}
