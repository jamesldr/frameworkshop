import 'package:flutter_modular/flutter_modular.dart';
import 'package:frameworkshop/app/modules/feed/feed_store.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  final FeedStore store = Modular.get();
  @observable
  double totalPrice = 0;
  @observable
  List<double> totalPriceList = [];

  @action
  getTotalPrice() {
    double priceHelper = 0;
    store.shoppingCart.forEach((e) {
      priceHelper += e.price!;
      totalPrice = priceHelper;
    });
  }
}
