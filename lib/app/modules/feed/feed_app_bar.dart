import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

import 'feed_store.dart';

class FeedAppBar extends StatelessWidget {
  FeedAppBar({
    Key? key,
  }) : super(key: key);

  final FeedStore store = Modular.get();

  OutlineInputBorder get inputEnabledBorder {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: .5),
    );
  }

  OutlineInputBorder get inputBorder {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    );
  }

  OutlineInputBorder get inputFocusedBorder {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: TextFormField(
              onChanged: (v) => store.getProducts(search: v),
              onFieldSubmitted: (v) => store.getProducts(search: v),
              decoration: InputDecoration(
                // prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.search),
                isDense: true,
                border: inputBorder,
                enabledBorder: inputEnabledBorder,
                focusedBorder: inputFocusedBorder,
                filled: true,
                // label: const Text('Pesquisa'),
                hintText: 'Pesquisa',
              ),
            ),
          ),
        ),
      ),
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
