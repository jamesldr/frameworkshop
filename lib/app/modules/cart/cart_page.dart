import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'cart_store.dart';
import '../feed/feed_store.dart';
import '../feed/product_card.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart),
        label: const Text('Finalizar compra'),
      ),
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
                    feedStore.shoppingCart
                        .forEach((v) => v == uniqueProduct ? amount++ : null);
                    return Dismissible(
                      key: Key('$i' + uniqueProduct.toJson().toString()),
                      direction: DismissDirection.startToEnd,
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
                        }
                        return result;
                      },
                      child: Card(
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 40.sp,
                                child: ProductImage(product: uniqueProduct),
                              ),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () => feedStore
                                            .shoppingCartAddItem(uniqueProduct),
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
                                        onTap: () =>
                                            feedStore.shoppingCartRemoveItem(
                                                uniqueProduct),
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
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                              .format(
                                                  uniqueProduct.price! * amount)
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
                                ),
                              )
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
