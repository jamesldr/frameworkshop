// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStoreBase, Store {
  final _$totalPriceAtom = Atom(name: '_CartStoreBase.totalPrice');

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

  final _$totalPriceListAtom = Atom(name: '_CartStoreBase.totalPriceList');

  @override
  List<double> get totalPriceList {
    _$totalPriceListAtom.reportRead();
    return super.totalPriceList;
  }

  @override
  set totalPriceList(List<double> value) {
    _$totalPriceListAtom.reportWrite(value, super.totalPriceList, () {
      super.totalPriceList = value;
    });
  }

  final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase');

  @override
  dynamic getTotalPrice() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.getTotalPrice');
    try {
      return super.getTotalPrice();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalPrice: ${totalPrice},
totalPriceList: ${totalPriceList}
    ''';
  }
}
