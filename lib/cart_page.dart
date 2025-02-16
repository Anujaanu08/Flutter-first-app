import 'package:flutter/material.dart';
import 'cart_notifier.dart';

class CartPage extends StatelessWidget {
  final CartNotifier cartNotifier;

  const CartPage({required this.cartNotifier, super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Map<String, dynamic>>>(
      valueListenable: cartNotifier,
      builder: (context, cartItems, child) {
        return Scaffold(
          appBar: AppBar(title: Text('Cart')),
          body: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final product = cartItems[index];
              return ListTile(
                title: Text(product['name']),
                subtitle: Text(product['price']),
                trailing: IconButton(
                  icon: Icon(Icons.remove_shopping_cart),
                  onPressed: () {
                    cartNotifier.value = cartNotifier.value
                        .where((item) => item != product)
                        .toList();
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
