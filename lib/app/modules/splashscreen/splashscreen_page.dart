import 'package:flutter_modular/flutter_modular.dart';
import 'package:frameworkshop/app/modules/splashscreen/splashscreen_store.dart';
import 'package:flutter/material.dart';

class SplashscreenPage extends StatefulWidget {
  final String title;
  const SplashscreenPage({Key? key, this.title = 'SplashscreenPage'}) : super(key: key);
  @override
  SplashscreenPageState createState() => SplashscreenPageState();
}
class SplashscreenPageState extends State<SplashscreenPage> {
  final SplashscreenStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}