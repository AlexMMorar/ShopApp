import 'package:flutter/material.dart';
import 'package:shop_app/widgets/products_grid.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My shop'),
        ),
        body: ProductsGrid());
  }
}
