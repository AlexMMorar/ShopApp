import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/user_products_screen.dart';

import 'screens/product_details_screen.dart';
import 'screens/products_overview_screen.dart';
import 'providers/products_provider.dart';
import 'providers/orders.dart';
import 'screens/orders_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContextcontext) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: ((ctx) => ProductDetailsScreen()),
          CartScreen.routeName: ((ctx) => const CartScreen()),
          OrdersScreen.routeName: ((ctx) => const OrdersScreen()),
          UserProductsScreen.routeName: ((ctx) => const UserProductsScreen()),
        },
      ),
    );
  }
}
