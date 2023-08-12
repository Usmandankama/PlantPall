import 'package:flutter/material.dart';
import 'package:plantpal/models/plants.dart';

import '../constants.dart';

class Details extends StatelessWidget {
  final Plant plant;
  const Details({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: primaryColor,
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
                      color: subfontColor,
                      fontSize: 16,
                      fontFamily: "Monospace",
                    ),
                  ),
                  Text(
                    plant.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Monospace",
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "SIZE",
                    style: TextStyle(
                      color: Color.fromARGB(177, 238, 238, 238),
                      fontSize: 16,
                      fontFamily: "Monospace",
                    ),
                  ),
                  Text(
                    plant.size,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Monospace",
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "PRICE",
                    style: TextStyle(
                      color: Color.fromARGB(177, 238, 238, 238),
                      fontSize: 16,
                      fontFamily: "Monospace",
                    ),
                  ),
                  Text(
                    "\$${plant.price}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Monospace",
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              height: 300,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "About Plant",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: "Monospace",
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 190,
            child: Image.asset(
              plant.imagePath,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
