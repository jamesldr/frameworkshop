import 'package:flutter_modular/flutter_modular.dart';
import 'package:frameworkshop/app/repository/repository.dart';
import 'package:frameworkshop/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStoreBase with _$FeedStore;

abstract class _FeedStoreBase with Store {
  final repo = Modular.get<Repository>();

  @observable
  ObservableList<ProductModel> products = <ProductModel>[].asObservable();
  @action
  getProducts() async {
    var list = await repo.getProducts();
    products = list.asObservable();
  }

  @observable
  ObservableList<ProductModel> shoppingCart = <ProductModel>[].asObservable();
  @action
  setShoppingCart(ObservableList<ProductModel> value) => shoppingCart = value;
  @action
  shoppingCartAddItem(ProductModel value) => shoppingCart.add(value);
  @action
  shoppingCartRemoveItem(ProductModel value) => shoppingCart.remove(value);
  @action
  shoppingCartCompletelyRemoveItem(ProductModel value) =>
      shoppingCart.removeWhere((model) => value == model);
  @action
  shoppingCartClear() => shoppingCart.clear();
}
