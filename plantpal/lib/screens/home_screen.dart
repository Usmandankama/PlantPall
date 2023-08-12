import 'package:flutter/material.dart';
import '../constants.dart'; // Import constants for styling
import '../widgets/featuredPlants.dart'; // Import the featured plants widget
import '../widgets/plantcategories.dart'; // Import the plant categories widget

void main() {
  runApp(const HomePage()); // Entry point of the application
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      title: 'Plant Shop',
      theme: ThemeData(
        primarySwatch: Colors.green, // Set the primary color swatch
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        extendBodyBehindAppBar: true, // Extend body behind the app bar
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
                        color: Colors.white, // Use white background for the search box
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
              const featured(),
              const SizedBox(
                height: 20,
              ),
              // Plant categories section
              const plantCategories(),
            ],
          ),
        ),
      ),
    );
  }
}
