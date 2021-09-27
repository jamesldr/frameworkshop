import 'package:flutter_modular/flutter_modular.dart';

import 'package:frameworkshop/app/modules/splashscreen/splashscreen_Page.dart';
import 'package:frameworkshop/app/modules/splashscreen/splashscreen_store.dart';

class SplashscreenModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashscreenStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashscreenPage()),
  ];
}
