import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

import 'feed_store.dart';

class FeedAppBar extends StatelessWidget {
  const FeedAppBar({
    Key? key,
    required this.store,
  }) : super(key: key);

  final FeedStore store;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text.rich(
        const TextSpan(text: 'Conceitual ', children: [
          TextSpan(text: 'S', style: TextStyle(color: Colors.red)),
          TextSpan(text: 'hop'),
        ]),
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
      actions: [
        InkWell(
          onTap: () {
            Modular.to.pushNamed('/cart');
          },
          child: Container(
            padding: const EdgeInsets.only(right: 16, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.shopping_cart),
                Observer(builder: (_) {
                  return SizedBox(
                    width: 20.sp,
                    child: Center(
                      child: Text(
                        store.shoppingCart.length.toString(),
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
