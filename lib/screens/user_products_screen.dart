import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/user_product_item.dart';
import '../providers/product.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/userProducts';
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [IconButton(onPressed: (() {}), icon: Icon(Icons.add))],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, index) => Column(
            children: [
              UserProductItem(productsData.items[index].title,
                  productsData.items[index].imageUrl),
              const Divider()
            ],
          ),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
