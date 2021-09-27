import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';

import 'feed_store.dart';

import 'feed_app_bar.dart';
import 'product_card.dart';
import 'waiting_products_widget.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({
    Key? key,
  }) : super(key: key);
  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends ModularState<FeedPage, FeedStore> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async => await store.getProducts());
  }

  @override
  Widget build(BuildContext context) {
    const portrait = Orientation.portrait;
    // ignore: unused_local_variable
    const landscape = Orientation.landscape;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: FeedAppBar(store: store),
      ),
      body: Container(
        constraints: BoxConstraints(minHeight: 100.h, minWidth: 100.w),
        child: LayoutBuilder(builder: (context, constraints) {
          return Observer(builder: (_) {
            // var children = List.generate(store.products.length, (i) {

            // });
            return store.products.isEmpty
                ? const WaitingProductsWidget()
                : StaggeredGridView.countBuilder(
                    itemCount: store.products.length,
                    crossAxisCount:
                        MediaQuery.of(context).orientation == portrait ? 1 : 2,
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(2),
                    itemBuilder: (BuildContext context, int i) {
                      final product = store.products[i];

                      return ProductCard(product: product, store: store);
                    },
                  );
          });
        }),
      ),
    );
  }
}
