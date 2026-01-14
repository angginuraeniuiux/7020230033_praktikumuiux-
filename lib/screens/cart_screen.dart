import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    if (cart.items.isEmpty) {
      return const Center(child: Text("Keranjang kosong"));
    }

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) {
        final product = cart.items[index];
        return ListTile(
          leading: Image.asset(product.image, width: 50),
          title: Text(product.name),
          subtitle: Text(product.price),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              cart.removeFromCart(product);
            },
          ),
        );
      },
    );
  }
}
