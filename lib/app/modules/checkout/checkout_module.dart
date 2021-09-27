import 'package:flutter_modular/flutter_modular.dart';

import 'checkout_Page.dart';
import 'checkout_store.dart';

class CheckoutModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CheckoutStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CheckoutPage()),
  ];
}
