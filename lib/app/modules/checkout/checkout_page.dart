import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frameworkshop/app/modules/checkout/checkout_store.dart';
import 'package:flutter/material.dart';
import 'package:frameworkshop/app/modules/feed/feed_store.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';

class CheckoutPage extends StatefulWidget {
  final String title;
  const CheckoutPage({Key? key, this.title = ''}) : super(key: key);
  @override
  CheckoutPageState createState() => CheckoutPageState();
}

class CheckoutPageState extends State<CheckoutPage> {
  final CheckoutStore store = Modular.get();
  final ScreenshotController ssController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final FeedStore feedStore = Modular.get();
    final formatCurrency = NumberFormat.simpleCurrency();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.share),
        onPressed: () async =>
            await store.screenshot(screenshotController: ssController),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Screenshot(
            controller: ssController,
            child: Container(
              color: Colors.white,
              child: RepaintBoundary(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'Comprovante',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        DateFormat('dd/MM/y').format(DateTime.now()),
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    ),
                    FutureBuilder(
                        future: store.populateInvoice(),
                        builder: (context, snapshot) {
                          return Observer(builder: (_) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: store.itens.length,
                              itemBuilder: (BuildContext context, int i) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              width: 30.w,
                                              child: Text(
                                                store.itens[i],
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              )),
                                          SizedBox(
                                            width: 30.w,
                                            child: Text(
                                              'Unidades: ' +
                                                  store.amount[i].toString(),
                                              style: TextStyle(fontSize: 11.sp),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: 15.w,
                                                child: Text(
                                                  '${store.amount[i]} x R\$ ' +
                                                      formatCurrency
                                                          .format(
                                                              store.price[i])
                                                          .toString()
                                                          .replaceAll(',', '')
                                                          .replaceAll('.', ',')
                                                          .replaceAll('\$', ''),
                                                  style:
                                                      TextStyle(fontSize: 7.sp),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15.w,
                                                child: Text(
                                                  'R\$ ' +
                                                      formatCurrency
                                                          .format(store
                                                                  .amount[i] *
                                                              store.price[i])
                                                          .toString()
                                                          .replaceAll(',', '')
                                                          .replaceAll('.', ',')
                                                          .replaceAll('\$', ''),
                                                  style: TextStyle(
                                                      fontSize: 11.sp),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 15.w,
                                child: Text(
                                  'Total:',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                                child: Text(
                                  'R\$ ' +
                                      formatCurrency
                                          .format(store.totalPrice)
                                          .toString()
                                          .replaceAll(',', '')
                                          .replaceAll('.', ',')
                                          .replaceAll('\$', ''),
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
