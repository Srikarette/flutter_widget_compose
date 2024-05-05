import 'package:flutter_widget_compose/network/http/dio_service.dart';
import 'package:flutter_widget_compose/network/http/http_service.dart';
import 'package:flutter_widget_compose/port/product.dart';
import 'package:flutter_widget_compose/repositories/product_repository.dart';
import 'package:flutter_widget_compose/services/product_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void registerServices() {
  getIt.registerSingleton<HttpService>(DioService('https://fakestoreapi.com'));
  getIt.registerSingleton<IProductRepository>(ProductRepository());
  getIt.registerSingleton<IProductService>(ProductService());

}