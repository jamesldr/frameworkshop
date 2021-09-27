import 'package:dio/dio.dart';
import 'package:frameworkshop/shared/models/product_model.dart';
import 'package:retrofit/retrofit.dart';
part 'repository.g.dart';

const String baseUrl = 'https://fakestoreapi.com/';

@RestApi(baseUrl: baseUrl)
abstract class Repository {
  factory Repository(Dio dio, {String baseUrl}) = _Repository;

  @GET('/products')
  Future<List<ProductModel>> getProducts();
}
  //'products'


