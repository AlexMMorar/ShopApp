import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
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
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, previousProducts) => Products(auth.token!),
          create: (context) => Products(''),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.purple,
                accentColor: Colors.deepOrange,
              ),
              fontFamily: 'Lato',
              textTheme: const TextTheme(
                titleMedium: TextStyle(color: Colors.black),
              ),
              primaryTextTheme:
                  const TextTheme(button: TextStyle(color: Colors.amber))),
          home: auth.isAuth ? ProductsOverviewScreen() : AuthScreen(),
          routes: {
            ProductDetailsScreen.routeName: ((ctx) => ProductDetailsScreen()),
            CartScreen.routeName: ((ctx) => const CartScreen()),
            OrdersScreen.routeName: ((ctx) => const OrdersScreen()),
            UserProductsScreen.routeName: ((ctx) => const UserProductsScreen()),
            EditProductScreen.routeName: ((ctx) => const EditProductScreen())
          },
        ),
      ),
    );
  }
}
