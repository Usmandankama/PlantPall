import 'package:flutter/material.dart';

import 'screens/SignupScreen.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Set the initial route to the HomeScreen
      initialRoute: '/',
      // Define routes to navigate between pages
      routes: {
        '/': (context) => const HomeScreen(),
        // '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Shop'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to the login page when the account icon is tapped
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Featured products section
            _buildSectionTitle('Featured Products'),
            _buildProductList(), // Replace with a product list widget

            // Categories section
            _buildSectionTitle('Categories'),
            _buildCategoryList(), // Replace with a category list widget
          ],
        ),
      ),
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Helper method to build a mock product list
  Widget _buildProductList() {
    // In a real app, you'd fetch product data and create product cards dynamically
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5, // Replace with the actual product count
      itemBuilder: (context, index) {
        // Mock product card
        return ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: Text('Product ${index + 1}'),
          subtitle: Text('Description of Product ${index + 1}'),
          trailing: Text('\$${(index + 1) * 10}'),
        );
      },
    );
  }

  // Helper method to build a mock category list
  Widget _buildCategoryList() {
    // In a real app, you'd fetch category data and create category cards dynamically
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: List.generate(
        8, // Replace with the actual category count
        (index) {
          // Mock category card
          return InkWell(
            onTap: () {
              // Handle category selection
              print('Category $index tapped');
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                'Category $index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ... LoginScreen and SignupScreen remain the same as in the previous example ...
