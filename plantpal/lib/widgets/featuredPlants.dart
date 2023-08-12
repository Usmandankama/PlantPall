// Ignore lint warnings for file names and camel case types
// (This is to suppress specific lint rules for this file)

import 'package:flutter/material.dart';

import '../models/plants.dart'; // Assuming this is the import for the Plant model
import '../screens/details.dart'; // Import the plant details screen

class featured extends StatefulWidget {
  const featured({super.key});

  @override
  State<featured> createState() => _featuredState();
}

class _featuredState extends State<featured> {
  // List of featured plants
  List<Plant> featuredPlants = [
    // Sample featured plants
    Plant("Large", 20.62, name: 'Monstera Deliciosa', imagePath: './assets/images/1.png'),
    Plant("Medium", 25.99, name: 'Lilly', imagePath: './assets/images/2.png'),
    Plant("Small", 20.88, name: 'Hibiscus', imagePath: './assets/images/3.png'),
    Plant("Small", 12.99, name: 'Whatever', imagePath: './assets/images/HermanoGato.png'),
  ];

  @override
  Widget build(BuildContext context) {
    // Implement the featured plant section
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Plants',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Implement the featured plant items using a GridView
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.8,
            ),
            itemCount: featuredPlants.length,
            itemBuilder: (context, index) {
              final plant = featuredPlants[index];
              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: InkWell(
                  onTap: () {
                    // Navigate to the plant details screen when a plant is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(plant: plant),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Featured plant image
                      Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(plant.imagePath),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                      ),
                      // Plant name
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          plant.name,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
