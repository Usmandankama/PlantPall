import 'package:flutter/material.dart';
import 'package:plantpal/models/plants.dart'; // Import the Plant model

import '../constants.dart'; // Import constants for styling

class Details extends StatefulWidget {
  final Plant plant; // Input: The plant object to display details about
  Details({super.key, required this.plant});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Plant> cartItems = [];

  void _addToCart(Plant plant) {
    setState(() {
      cartItems.add(plant);
    });
  }

  @override
  Widget build(BuildContext context) {
    // The main widget that displays plant details
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0, // No shadow under app bar
      ),
      extendBodyBehindAppBar: true, // Allow the body to extend behind app bar
      body: Stack(
        children: [
          // Top colored container for the plant's basic details
          Container(
            decoration: const BoxDecoration(
              color: primaryColor, // Use the primary background color
            ),
            height: 600,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.only(top: 80, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "NAME",
                    style: TextStyle(
                      color: subfontColor, // Use subfont color
                      fontSize: 16,
                      fontFamily: "Monospace",
                    ),
                  ),
                  Text(
                    widget.plant.name, // Display the plant's name
                    style: const TextStyle(
                        color: Colors.white, // Use white text color
                        fontSize: 18,
                        fontFamily: "Monospace",
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 20),
                  // Display the plant's size
                  const Text(
                    "SIZE",
                    style: TextStyle(
                      color: Color.fromARGB(
                          177, 238, 238, 238), // Use a muted color for subfont
                      fontSize: 16,
                      fontFamily: "Monospace",
                    ),
                  ),
                  Text(
                    widget.plant.size, // Display the plant's size
                    style: const TextStyle(
                        color: Colors.white, // Use white text color
                        fontSize: 18,
                        fontFamily: "Monospace",
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 20),
                  // Display the plant's price
                  const Text(
                    "PRICE",
                    style: TextStyle(
                      color: Color.fromARGB(
                          177, 238, 238, 238), // Use a muted color for subfont
                      fontSize: 16,
                      fontFamily: "Monospace",
                    ),
                  ),
                  Text(
                    "\$${widget.plant.price}", // Display the plant's price with a dollar sign
                    style: const TextStyle(
                        color: Colors.white, // Use white text color
                        fontSize: 18,
                        fontFamily: "Monospace",
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // White container for the "About Plant" section
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors
                      .white, // Use white background color for the "About Plant" section
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              height: 300,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title for the "About Plant" section
                    const Text(
                      "About Plant",
                      style: TextStyle(
                        fontWeight: FontWeight.w800, // Use a bold font weight
                        fontFamily: "Monospace",
                        fontSize: 22,
                        color: Colors.black, // Use black text color
                      ),
                    ),
                    const Expanded(
                      child: Text("Decription"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Center(
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(0),
                            backgroundColor:
                                MaterialStatePropertyAll(primaryColor),
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                            child: Text("Add to Cart"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned image of the plant
          Positioned(
            top: 80,
            left: 190,
            child: Image.asset(
              widget.plant.imagePath, // Display the plant's image
              height: 300,
              fit: BoxFit.cover, // Scale the image to cover the container
            ),
          ),
        ],
      ),
    );
  }
}
