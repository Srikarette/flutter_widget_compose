import 'package:flutter/material.dart';
import 'package:flutter_widget_compose/di/get_it.dart';
import 'package:flutter_widget_compose/entities/product.dart';
import 'package:flutter_widget_compose/widgets/compounds/jumbotron/home_jumbotron.dart';
import 'package:flutter_widget_compose/widgets/compounds/loading/loading_indicator.dart';
import 'package:flutter_widget_compose/widgets/compounds/navbar/home_nav.dart';
import 'package:flutter_widget_compose/widgets/compounds/sections/catalog.dart';

import '../mocks/products.dart';
import '../port/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final IProductService service = getIt.get<IProductService>();

  List<List<ProductToDisplay>> products = [];
  List<String> categories = [];

  bool isLoading = false;


  @override
  void initState() {
    getProducts();
    super.initState();
  }

  void getProducts() async {

    setState(() {
      isLoading = true;
    });
    final categories = await service.getCategories();
    final productsFetchers = categories.map((e) => service.getByCategory(e));
    final products = await Future.wait(productsFetchers);

    setState(() {
      this.categories = categories;
      this.products = products;
      isLoading = false;
    });
  }

  void onSelectProduct(ProductToDisplay product) {
    print(product.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const HomeNavbar(),
              Expanded(
                  child: isLoading
                      ? const Loading()
                      : ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          HomeJumbotron(
                              imageUrl: categoryImages[categories[index]]!,
                              title: categories[index].toUpperCase(),
                              buttonTitle: 'View Collection'
                          ),
                          Catalog(title: 'All products',products: products[index], onSelectProduct: onSelectProduct,),
                          const SizedBox(height: 24,)
                        ],
                      );},)
              )
            ],
          ),
        ),
    );
  }
}
