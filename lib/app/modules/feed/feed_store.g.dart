// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedStore on _FeedStoreBase, Store {
  final _$productsAtom = Atom(name: '_FeedStoreBase.products');

  @override
  ObservableList<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$shoppingCartAtom = Atom(name: '_FeedStoreBase.shoppingCart');

  @override
  ObservableList<ProductModel> get shoppingCart {
    _$shoppingCartAtom.reportRead();
    return super.shoppingCart;
  }

  @override
  set shoppingCart(ObservableList<ProductModel> value) {
    _$shoppingCartAtom.reportWrite(value, super.shoppingCart, () {
      super.shoppingCart = value;
    });
  }

  final _$getProductsAsyncAction = AsyncAction('_FeedStoreBase.getProducts');

  @override
  Future getProducts({String? search}) {
    return _$getProductsAsyncAction
        .run(() => super.getProducts(search: search));
  }

  final _$_FeedStoreBaseActionController =
      ActionController(name: '_FeedStoreBase');

  @override
  dynamic setShoppingCart(ObservableList<ProductModel> value) {
    final _$actionInfo = _$_FeedStoreBaseActionController.startAction(
        name: '_FeedStoreBase.setShoppingCart');
    try {
      return super.setShoppingCart(value);
    } finally {
      _$_FeedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic shoppingCartAddItem(ProductModel value) {
    final _$actionInfo = _$_FeedStoreBaseActionController.startAction(
        name: '_FeedStoreBase.shoppingCartAddItem');
    try {
      return super.shoppingCartAddItem(value);
    } finally {
      _$_FeedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic shoppingCartRemoveItem(ProductModel value) {
    final _$actionInfo = _$_FeedStoreBaseActionController.startAction(
        name: '_FeedStoreBase.shoppingCartRemoveItem');
    try {
      return super.shoppingCartRemoveItem(value);
    } finally {
      _$_FeedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic shoppingCartCompletelyRemoveItem(ProductModel value) {
    final _$actionInfo = _$_FeedStoreBaseActionController.startAction(
        name: '_FeedStoreBase.shoppingCartCompletelyRemoveItem');
    try {
      return super.shoppingCartCompletelyRemoveItem(value);
    } finally {
      _$_FeedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic shoppingCartClear() {
    final _$actionInfo = _$_FeedStoreBaseActionController.startAction(
        name: '_FeedStoreBase.shoppingCartClear');
    try {
      return super.shoppingCartClear();
    } finally {
      _$_FeedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
shoppingCart: ${shoppingCart}
    ''';
  }
}
