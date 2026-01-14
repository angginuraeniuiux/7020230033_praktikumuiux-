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
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.image,
                height: 220,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),

            // NAMA PRODUK
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // HARGA (BIRU)
            Text(
              product.price,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // DESKRIPSI (TUGAS TAMBAHAN)
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),

            // TOMBOL TAMBAH KE KERANJANG
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .addToCart(product);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Produk ditambahkan ke keranjang"),
                    ),
                  );
                },
                child: const Text("Tambah ke Keranjang"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
