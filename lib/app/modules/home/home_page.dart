import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frameworkshop/shared/widgets/custom_elevated_button.dart';
import 'package:frameworkshop/shared/widgets/logo_widget.dart';
import 'package:sizer/sizer.dart';

import 'package:frameworkshop/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  final HomeStore store = Modular.get();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 100.h,
            minWidth: 100.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LogoWidget(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                child: CustomElevatedButton(
                  text: 'Entrar',
                  onPressed: () {
                    Modular.to.pushNamed('/login');
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
