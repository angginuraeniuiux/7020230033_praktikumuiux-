import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              product.image,
              height: 250,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              product.price,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // ✅ DESKRIPSI PRODUK (TUGAS TAMBAHAN MODUL)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                product.description,
                style: const TextStyle(
                  color: Colors.grey,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .addToCart(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Ditambahkan ke keranjang")),
                );
              },
              child: const Text("Tambah ke Keranjang"),
            ),
          ],
        ),
      ),
    );
  }
}
