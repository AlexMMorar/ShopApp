import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
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
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'ORDER NOW',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
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
