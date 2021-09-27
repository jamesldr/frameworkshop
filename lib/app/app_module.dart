import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frameworkshop/app/repository/repository.dart';

import 'modules/cart/cart_module.dart';
import 'modules/checkout/checkout_module.dart';
import 'modules/feed/feed_module.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Repository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/feed', module: FeedModule()),
    ModuleRoute('/cart', module: CartModule()),
    ModuleRoute('/checkout', module: CheckoutModule()),
  ];
}
