import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'package:frameworkshop/shared/models/product_model.dart'
    show ProductModel;

import 'cart_store.dart';

class ProductCartItemPrice extends StatelessWidget {
  ProductCartItemPrice({
    Key? key,
    required this.formatCurrency,
    required this.uniqueProduct,
    required this.amount,
    required this.index,
  }) : super(key: key);

  final NumberFormat formatCurrency;
  final ProductModel uniqueProduct;
  final int amount;
  final int index;
  final CartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'PREÇO',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'R\$ ' +
              formatCurrency
                  .format(uniqueProduct.price! * amount)
                  .replaceAll(',', '')
                  .replaceAll('.', ',')
                  .replaceAll('\$', ''),
          style: TextStyle(
            fontSize: 13.sp,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          textAlign: TextAlign.start,
        )
      ],
    );
  }
}
