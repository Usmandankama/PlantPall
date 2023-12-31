// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import '../constants.dart'; // Import constants for styling
import '../widgets/featuredPlants.dart'; // Import the featured plants widget
import '../widgets/plantcategories.dart'; // Import the plant categories widget
import 'package:google_nav_bar/google_nav_bar.dart';

import 'SignupScreen.dart';
import 'cart.dart';
import 'products.dart';

void main() {
  runApp(const HomeScreen()); // Entry point of the application
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final screens = [
    const HomePage(),
    const Products(),
    const SignupScreen(),
    const EcommerceCartApp()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      title: 'Plant Shop',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        extendBodyBehindAppBar: true, // Extend body behind the app bar
        body: screens[_index],
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            activeColor: const Color.fromARGB(255, 0, 0, 0),
            tabBackgroundColor: const Color.fromARGB(150, 199, 199, 199),
            tabs: const [
              GButton(
                icon: Icons.storefront,
                text: "Home",
              ),
              GButton(
                icon: Icons.inventory_2_outlined,
                text: "Products",
              ),
              GButton(
                icon: Icons.category_outlined,
                text: "Cartegories",
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
                text: "Cart",
              ),
            ],
            selectedIndex: _index,
            onTabChange: (value) {
              setState(() {
                _index = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // The top section with the app title, search, and featured plants
            Container(
              padding: const EdgeInsets.only(
                  top: 50, bottom: 16, left: 16, right: 16),
              decoration: const BoxDecoration(
                color: primaryColor, // Use the primary background color
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  // App title
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "PlantPal",
                      style: TextStyle(
                        color: Colors.white, // Use white text color
                        fontSize: 80,
                        fontFamily: "Cursive",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  // App slogan
                  const Center(
                    child: Text(
                      'Find the perfect plants for your home',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white, // Use white text color
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Search input field
                  Container(
                    decoration: BoxDecoration(
                      color: Colors
                          .white, // Use white background for the search box
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Search for plants',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none, // Hide the input border
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Featured plants section
            // Plant categories section
            const plantCategories(),
                        const SizedBox(
              height: 20,
            ),
            const featured()
          ],
        ),
      ),
    );
  }
}
