import 'package:flutter/material.dart';
import 'package:plantpal/constants.dart';

import '../models/plants.dart';

void main() {
  runApp(const EcommerceCartApp());
}

class EcommerceCartApp extends StatelessWidget {
  const EcommerceCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'E-commerce Cart',
      home: EcommerceCartScreen(),
    );
  }
}

class EcommerceCartScreen extends StatefulWidget {
  const EcommerceCartScreen({super.key});

  @override
  _EcommerceCartScreenState createState() => _EcommerceCartScreenState();
}

class _EcommerceCartScreenState extends State<EcommerceCartScreen> {
  List<Plant> cartItems = [];

  void _addToCart(Plant plant) {
    setState(() {
      cartItems.add(plant);
    });
  }

  void _removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  Widget _buildCartItem(Plant Plant, int index) {
    return ListTile(
      leading: const Icon(Icons.shopping_cart),
      title: Text(Plant.name),
      trailing: IconButton(
        icon: const Icon(Icons.remove_shopping_cart),
        onPressed: () => _removeFromCart(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: primaryColor,
        title: const Text('E-commerce Cart',),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return _buildCartItem(cartItems[index], index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final plant =
              Plant("Large", 20.33, name: "PlantName", imagePath: "./","Succulent");
          _addToCart(plant);
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
