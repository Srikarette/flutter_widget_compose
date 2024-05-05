import 'package:flutter/material.dart';
import 'package:flutter_widget_compose/entities/product.dart';
import 'package:flutter_widget_compose/widgets/elements/texts/price_text.dart';
import 'package:flutter_widget_compose/widgets/elements/texts/small_text.dart';

class ProductCard extends StatelessWidget {
  final ProductToDisplay product;
  final Function(ProductToDisplay)? onProductClick; // Callback for click event

  const ProductCard({
    Key? key,
    required this.product,
    required this.onProductClick, // Accept callback
  }) : super(key: key);

  final double width = 200;
  final double height = 240;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onProductClick!(product), // Trigger callback when tapped
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Image.network(
              product.imageUrl,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Spacer(),
                Container(
                  color: Color(0x88000000),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: SmallText(
                            title: product.name,
                            color: Colors.white,
                          ),
                        ),
                        PriceText(price: '${product.price}\$'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
