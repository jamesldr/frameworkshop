import 'package:frameworkshop/shared/models/product_model.dart';

class Repository {
  // @GET('/products')
  // Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getProducts() async {
    return await [
      ProductModel(
        title: 'Maçã',
        description: '1 kg de Maça fresca',
        price: 3.00,
        image:
            'http://www.falarempublico.com.br/wp-content/uploads/2014/04/maca.jpg',
      ),
      ProductModel(
        title: 'Pêra',
        description: '1 kg de Pêra',
        price: 1.50,
        image:
            'https://ibassets.com.br/ib.item.image.big/b-f9218a950b06450b86e8e341db55bd0d.jpeg',
      ),
      ProductModel(
        title: 'Banana',
        description: '1 kg de Banana',
        price: 1.0,
        image:
            'https://cdn.awsli.com.br/1000x1000/1304/1304561/produto/52600382/b77ef17dfc.jpg',
      ),
      ProductModel(
        title: 'Abacaxi',
        description: '1 uniade de Abacaxi',
        price: 5.50,
        image:
            'https://www.infoescola.com/wp-content/uploads/2010/01/abacaxi-745437190.jpg',
      ),
      ProductModel(
        title: 'Manga',
        description: '1 unidade de Manga',
        price: 3.50,
        image:
            'https://cd.shoppub.com.br/cenourao/media/cache/52/9c/529cf4b17f9eaeeeffa58306e32f42f4.png',
      ),
    ];
  }
}
  //'products'


