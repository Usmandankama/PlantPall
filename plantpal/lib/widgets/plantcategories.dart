// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../models/Category.dart';

class plantCategories extends StatefulWidget {
  const plantCategories({super.key});

  @override
  State<plantCategories> createState() => _plantCategoriesState();
}

class _plantCategoriesState extends State<plantCategories> {
// Placeholder data for plant categories
  List<PlantCategory> plantCategories = [
    PlantCategory(name: 'Indoor Plants', icon: Icons.local_florist),
    PlantCategory(name: 'Outdoor Plants', icon: Icons.eco),
    PlantCategory(name: 'Cactus', icon: Icons.eco_outlined),
    PlantCategory(name: 'Succulents', icon: Icons.grass),
    PlantCategory(name: 'Bonsai', icon: Icons.nature),
    PlantCategory(name: 'Herbs', icon: Icons.local_dining),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Plant Categories',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Implement the plant category items
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // You can adjust the number of columns
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: plantCategories.length,
            itemBuilder: (context, index) {
              final category = plantCategories[index];
              return Card(
                elevation: 2.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: InkWell(
                  onTap: () {
                    // Navigate to the plant category details screen
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => PlantCategoryScreen(category: category),
                    //   ),
                    // );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Plant category icon
                      Icon(
                        category.icon,
                        size: 40.0,
                        color: Colors.green,
                      ),
                      const SizedBox(height: 8.0),
                      // Plant category name
                      Text(
                        category.name,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
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
