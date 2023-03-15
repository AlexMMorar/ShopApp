import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shop_app/providers/cart.dart';

import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final uri = Uri(
        scheme: 'https',
        host:
            'flutter-update-e2a4b-default-rtdb.europe-west1.firebasedatabase.app',
        path: 'orders.json');

    try {
      final time = DateTime.now();
      final result = await http.post(uri,
          body: json.encode({
            'amount': total,
            'products': cartProducts.map((e) {
              return {
                'title': e.title,
                'price': e.price,
                'quantity': e.quantity
              };
            }).toList(),
            'dateTime': time.toString()
          }));
      final orderStored = OrderItem(
          id: json.decode(result.body)['name'],
          amount: total,
          products: cartProducts,
          dateTime: time);

      _orders.insert(0, orderStored);
      notifyListeners();
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
