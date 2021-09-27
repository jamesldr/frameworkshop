import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'package:frameworkshop/shared/models/product_model.dart';

import '../feed/feed_store.dart';
import '../feed/product_card.dart';
import 'cart_store.dart';
import 'product_cart_item_price.dart';

class CartPage extends StatefulWidget {
  final String title;

  const CartPage({Key? key, this.title = 'Carrinho de compras'})
      : super(key: key);
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  final CartStore store = Modular.get();
  final FeedStore feedStore = Modular.get();
  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  void initState() {
    super.initState();
    store.getTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Observer(builder: (_) {
        return FloatingActionButton.extended(
          onPressed: () {
            Modular.to.pushNamed('/checkout');
          },
          icon: const Icon(Icons.shopping_cart),
          label: Column(
            children: [
              Text(
                'R\$ ' +
                    formatCurrency
                        .format(store.totalPrice)
                        .replaceAll(',', '')
                        .replaceAll('.', ',')
                        .replaceAll('\$', ''),
                style: TextStyle(fontSize: 12.sp),
              ),
              const Text('Finalizar compra'),
            ],
          ),
        );
      }),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Observer(
              builder: (_) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: feedStore.shoppingCart.toSet().toList().length,
                  itemBuilder: (_, i) {
                    var uniqueProduct =
                        feedStore.shoppingCart.toSet().toList()[i];
                    var amount = 0;
                    for (var v in feedStore.shoppingCart) {
                      v == uniqueProduct ? amount++ : null;
                    }

                    return Dismissible(
                      key: Key('$i' + uniqueProduct.toJson().toString()),
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: Colors.red,
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Icon(
                                Icons.delete,
                                size: 36,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      confirmDismiss: (direction) async {
                        var result = false;
                        await showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text(
                              'Deseja remover este item do carrinho?',
                            ),
                            content: const Text(
                              ''
                              'Essa ação removerá este item'
                              ' e todas as suas duplicatas'
                              ' do carrinho de compras'
                              '',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Modular.to.pop(),
                                child: const Text('Não'),
                              ),
                              TextButton(
                                onPressed: () {
                                  result = true;
                                  Modular.to.pop();
                                },
                                child: const Text('Sim'),
                              ),
                            ],
                          ),
                        );
                        if (result) {
                          feedStore
                              .shoppingCartCompletelyRemoveItem(uniqueProduct);
                          store.getTotalPrice();
                        }
                        return result;
                      },
                      child: Card(
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              ProductCartImage(uniqueProduct: uniqueProduct),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SizedBox(
                                  width: 35.w,
                                  child: Column(
                                    children: [
                                      Text(
                                        uniqueProduct.title.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        uniqueProduct.description.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ProductCartItemPrice(
                                  index: i,
                                  formatCurrency: formatCurrency,
                                  uniqueProduct: uniqueProduct,
                                  amount: amount,
                                ),
                              ),
                              ProductCartAddRemoveItemButtons(
                                feedStore: feedStore,
                                uniqueProduct: uniqueProduct,
                                amount: amount,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox.square(dimension: 65),
          ],
        ),
      ),
    );
  }
}

class ProductCartAddRemoveItemButtons extends StatelessWidget {
  ProductCartAddRemoveItemButtons({
    Key? key,
    required this.feedStore,
    required this.uniqueProduct,
    required this.amount,
  }) : super(key: key);

  final FeedStore feedStore;
  final ProductModel uniqueProduct;
  final int amount;
  final CartStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                feedStore.shoppingCartAddItem(uniqueProduct);
                store.getTotalPrice();
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'x$amount',
              style: TextStyle(fontSize: 12.sp),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                feedStore.shoppingCartRemoveItem(uniqueProduct);
                store.getTotalPrice();
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCartImage extends StatelessWidget {
  const ProductCartImage({
    Key? key,
    required this.uniqueProduct,
  }) : super(key: key);

  final ProductModel uniqueProduct;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.sp,
      child: ProductImage(product: uniqueProduct),
    );
  }
}
