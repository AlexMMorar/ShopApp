import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final isCartEmpty = cart.itemCount == 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(children: [
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            // ignore: prefer_const_literals_to_create_immutables
            child: Row(children: [
              const Text(
                'Total',
                style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              Chip(
                label: Text(
                  '\$${cart.totalAmount}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: !isCartEmpty
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
              TextButton(
                onPressed: !isCartEmpty
                    ? () async {
                        Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(),
                          cart.totalAmount,
                        );
                        cart.clear();
                      }
                    : null,
                child: Text(
                  'ORDER NOW',
                  style: TextStyle(
                      color: !isCartEmpty
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey),
                ),
              )
            ]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: ((ctx, index) {
              var cartItem = cart.items.values.toList()[index];
              return CartItem(
                cartItem.id,
                cart.items.keys.toList()[index],
                cartItem.price,
                cartItem.quantity,
                cartItem.title,
              );
            }),
            itemCount: cart.itemCount,
          ),
        ),
      ]),
    );
  }
}
