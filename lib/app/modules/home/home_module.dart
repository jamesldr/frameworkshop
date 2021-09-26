import 'package:flutter_modular/flutter_modular.dart';

import 'package:frameworkshop/app/modules/home/home_page.dart';
import 'package:frameworkshop/app/modules/home/home_store.dart';

import '../home/home_store.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
