import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';

final List<Product> dummyProducts = [
  Product(
    name: "Laptop Gaming",
    price: "Rp 15.000.000",
    description: "Laptop gaming performa tinggi untuk kerja dan bermain.",
    image: "assets/images/laptop.png",
  ),
  Product(
    name: "Mouse Wireless",
    price: "Rp 250.000",
    description: "Mouse wireless nyaman dan hemat baterai.",
    image: "assets/images/mouse.png",
  ),
  Product(
    name: "Keyboard Mechanical",
    price: "Rp 800.000",
    description: "Keyboard mechanical dengan lampu RGB.",
    image: "assets/images/keyboard.png",
  ),
  Product(
    name: "Headset Gaming",
    price: "Rp 500.000",
    description: "Headset gaming dengan suara jernih dan bass mantap.",
    image: "assets/images/headset.png",
  ),
  Product(
    name: "Monitor 24 inch",
    price: "Rp 2.500.000",
    description: "Monitor Full HD 24 inch untuk kerja dan gaming.",
    image: "assets/images/monitor.png",
  ),
  Product(
    name: "USB Hub",
    price: "Rp 100.000",
    description: "USB Hub 4 port untuk tambahan konektivitas.",
    image: "assets/images/usb.png",
  ),
  Product(
    name: "Mousepad RGB",
    price: "Rp 150.000",
    description: "Mousepad gaming dengan lampu RGB.",
    image: "assets/images/mousepad.png",
  ),
  Product(
    name: "Webcam HD",
    price: "Rp 350.000",
    description: "Webcam HD untuk meeting dan streaming.",
    image: "assets/images/webcame.png",
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
  const ProductGridScreen(),
  CartScreen(),
  const ProfileScreen(),
];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Cari produk impian...",
                    prefixIcon:
                        const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Produk",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: "Keranjang",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}

class ProductGridScreen extends StatelessWidget {
  const ProductGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Produk Terbaru",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              itemCount: dummyProducts.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: dummyProducts[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
