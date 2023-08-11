import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Shop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildFeaturedPlants(context),
            _buildPlantCategories(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to Plant Shop',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Find the perfect plants for your home',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search for plants',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedPlants(BuildContext context) {
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
          // Implement the featured plant items
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
              return _buildFeaturedPlantItem(context, plant);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedPlantItem(BuildContext context, Plant plant) {
    // Implement a widget representing a featured plant item
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to the plant details screen
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => PlantDetailsScreen(plant: plant),
          //   ),
          // );
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
  }

  Widget _buildPlantCategories(BuildContext context) {
    // Implement the plant categories section
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
              return _buildPlantCategoryItem(context, category);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPlantCategoryItem(BuildContext context, PlantCategory category) {
    // Implement a widget representing a plant category item
    return Card(
      elevation: 4.0,
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
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Data model for a plant
class Plant {
  final String name;
  
  final String imagePath;

  Plant({required this.name, required this.imagePath});
}

// Data model for a plant category
class PlantCategory {
  final String name;
  final IconData icon;

  PlantCategory({required this.name, required this.icon});
}

// Placeholder data for featured plants
List<Plant> featuredPlants = [
  Plant(name: 'Monstera Deliciosa', imagePath: './assets/images/HermanoGato.png'),
  Plant(name: 'Peace Lily', imagePath: './assets/images/montera.jpg'),
  Plant(name: 'Fiddle Leaf Fig', imagePath: './assets/images/Strelizia.jpg'),
  Plant(name: 'Snake Plant', imagePath: './assets/images/potted.jpg'),
];

// Placeholder data for plant categories
List<PlantCategory> plantCategories = [
  PlantCategory(name: 'Indoor Plants', icon: Icons.local_florist),
  PlantCategory(name: 'Outdoor Plants', icon: Icons.eco),
  PlantCategory(name: 'Cactus', icon: Icons.eco_outlined),
  PlantCategory(name: 'Succulents', icon: Icons.grass),
  PlantCategory(name: 'Bonsai', icon: Icons.nature),
  PlantCategory(name: 'Herbs', icon: Icons.local_dining),
];
