import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frameworkshop/app/modules/home/home_store.dart';
import 'package:frameworkshop/app/modules/login/login_store.dart';
import 'package:frameworkshop/shared/widgets/custom_elevated_button.dart';
import 'package:frameworkshop/shared/widgets/logo_widget.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  final String title;
  final HomeStore store = Modular.get();
  LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            color: Colors.red,
            constraints: BoxConstraints(minWidth: 100.w, minHeight: 100.h),
          ),
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.h),
                    child: const LogoWidget(
                      accentColor: Colors.white,
                      size: 20,
                    ),
                  ),
                  Container(
                    width: 95.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.w, vertical: 2.5.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: .5.h),
                            child: TextFormField(
                              initialValue: store.user,
                              onChanged: store.userOnChanged,
                              decoration: InputDecoration(
                                isDense: true,
                                border: inputBorder,
                                enabledBorder: inputEnabledBorder,
                                focusedBorder: inputFocusedBorder,
                                filled: true,
                                label: const Text('Usuário'),
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: .5.h),
                            child: Observer(builder: (_) {
                              return TextFormField(
                                onChanged: store.passwordOnChanged,
                                obscureText: !store.pwVisibile,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: store.togglePwVisibile,
                                    icon: Icon(
                                      store.pwVisibile
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  isDense: true,
                                  border: inputBorder,
                                  enabledBorder: inputEnabledBorder,
                                  focusedBorder: inputFocusedBorder,
                                  filled: true,
                                  label: const Text('Senha'),
                                ),
                              );
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            child: Observer(builder: (_) {
                              return CustomElevatedButton(
                                text: 'Login',
                                onPressed: store.isBusy
                                    ? null
                                    : () {
                                        if (formKey.currentState?.validate() ??
                                            false) {
                                          store.onLogin();
                                        }
                                      },
                                isLoading: store.isBusy,
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder get inputFocusedBorder {
    return OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: const BorderSide(color: Colors.red),
    );
  }

  OutlineInputBorder get inputEnabledBorder {
    return OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: const BorderSide(color: Colors.black, width: .5),
    );
  }

  OutlineInputBorder get inputBorder {
    return OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }

  BorderRadius get inputBorderRadius {
    return const BorderRadius.all(
      Radius.circular(20),
    );
  }
}
