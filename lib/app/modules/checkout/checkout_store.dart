import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frameworkshop/app/modules/feed/feed_store.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ' as pw;
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

part 'checkout_store.g.dart';

class CheckoutStore = _CheckoutStoreBase with _$CheckoutStore;

abstract class _CheckoutStoreBase with Store {
  final FeedStore feedStore = Modular.get();
  @observable
  var itens = <String>[].asObservable();
  @observable
  var amount = <int>[].asObservable();
  @observable
  var price = <double>[].asObservable();
  @observable
  double totalPrice = 0;

  @action
  populateInvoice() async {
    itens.clear();
    amount.clear();
    price.clear();
    feedStore.shoppingCart.toSet().toList().forEach((e) {
      itens.add(e.title!);
      price.add(e.price!);
    });
    itens.forEach((item) {
      var count = 0;
      feedStore.shoppingCart.forEach((e) {
        if (e.title == item) {
          count++;
        }
      });
      amount.add(count);
    });
    totalPrice = 0;
    for (var i = 0; i < price.length; i++) {
      totalPrice += price[i] * amount[i];
    }
  }

  screenshot({required ScreenshotController screenshotController}) async {
    screenshotController.capture().then(
      (Uint8List? image) async {
        //Capture Done
        Directory tempDir = await getApplicationDocumentsDirectory();
        String tempPath = tempDir.path;
        var x = await Image.memory(image!);

        pw.Document pdf = pw.Document();
        print(x.height);
        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (_) {
              return pw.Expanded(
                child: pw.Image(
                  pw.MemoryImage(image),
                  fit: pw.BoxFit.contain,
                ),
              );
            },
          ),
        );
        final pdfFile = await File('$tempPath/comprovante.pdf')
            .writeAsBytes(await pdf.save());
        Share.shareFiles([pdfFile.path], text: 'Comprovante');
      },
    ).catchError((onError) {
      print(onError);
    });
  }
}
