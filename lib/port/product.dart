import 'package:flutter_widget_compose/entities/product.dart';
import 'package:flutter_widget_compose/models/Product.dart';

abstract class IProductRepository {
  Future<List<Product>> getByCategory(String category);
  Future<List<String>> getCategories();
}

abstract class IProductService {
  Future<List<ProductToDisplay>> getByCategory(String category);
  Future<List<String>> getCategories();
}