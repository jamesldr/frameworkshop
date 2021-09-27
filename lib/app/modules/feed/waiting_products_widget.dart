import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'feed_store.dart';

class WaitingProductsWidget extends StatelessWidget {
  WaitingProductsWidget({
    Key? key,
  }) : super(key: key);

  final FeedStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Center(child: Builder(
      builder: (context) {
        store.onLoading();
        return Observer(builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              store.loadingMsg != 'Carregando lista de produtos'
                  ? Container()
                  : const CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(store.loadingMsg),
              ),
            ],
          );
        });
      },
    ));
  }
}
