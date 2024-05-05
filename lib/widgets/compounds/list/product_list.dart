import 'package:flutter/material.dart';
import 'package:flutter_widget_compose/entities/product.dart';
import 'package:flutter_widget_compose/widgets/compounds/cards/product_card.dart';

class ProductList extends StatelessWidget {
  final List<ProductToDisplay> products;
  final Function(ProductToDisplay)? onProductClick;
  
  const ProductList({
    Key? key,
    required this.products,
    this.onProductClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 16),
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            onProductClick: onProductClick ,
          );
        },
      ),
    );
  }
}
