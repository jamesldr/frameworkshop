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
  getProducts({String? search}) async {
    var list = await repo.getProducts();
    if (search != null && search != '') {
      products.clear();
      for (var e in list) {
        if (e.title!.toLowerCase().contains(search.toLowerCase())) {
          products.add(e);
        }
      }
    } else {
      products = list.asObservable();
    }
  }

  @observable
  ObservableList<ProductModel> shoppingCart = <ProductModel>[].asObservable();

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
