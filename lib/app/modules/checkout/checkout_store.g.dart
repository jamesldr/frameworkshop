// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CheckoutStore on _CheckoutStoreBase, Store {
  final _$itensAtom = Atom(name: '_CheckoutStoreBase.itens');

  @override
  ObservableList<String> get itens {
    _$itensAtom.reportRead();
    return super.itens;
  }

  @override
  set itens(ObservableList<String> value) {
    _$itensAtom.reportWrite(value, super.itens, () {
      super.itens = value;
    });
  }

  final _$amountAtom = Atom(name: '_CheckoutStoreBase.amount');

  @override
  ObservableList<int> get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(ObservableList<int> value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$priceAtom = Atom(name: '_CheckoutStoreBase.price');

  @override
  ObservableList<double> get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(ObservableList<double> value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$totalPriceAtom = Atom(name: '_CheckoutStoreBase.totalPrice');

  @override
  double get totalPrice {
    _$totalPriceAtom.reportRead();
    return super.totalPrice;
  }

  @override
  set totalPrice(double value) {
    _$totalPriceAtom.reportWrite(value, super.totalPrice, () {
      super.totalPrice = value;
    });
  }

  final _$populateInvoiceAsyncAction =
      AsyncAction('_CheckoutStoreBase.populateInvoice');

  @override
  Future populateInvoice() {
    return _$populateInvoiceAsyncAction.run(() => super.populateInvoice());
  }

  @override
  String toString() {
    return '''
itens: ${itens},
amount: ${amount},
price: ${price},
totalPrice: ${totalPrice}
    ''';
  }
}
