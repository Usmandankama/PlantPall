// Import necessary packages and dependencies
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
// Import the login page
import '../main.dart'; // Import the main app (assuming this file is in the same directory)

// Define the SignupScreen widget
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

// State class for the SignupScreen widget
class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          // Set the background image
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "./assets/images/catamaran.jpg"), // Placeholder image path
              fit: BoxFit.cover, // Cover the entire container with the image
            ),
          ),
          child: Column(
            children: [
              // App title and navigation to the startup screen
              Expanded(
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      // Navigate to the startup screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartUpScreen()));
                    },
                    child: const Text(
                      "PlantPal",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                          fontFamily: "Cursive",
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              // Signup form container with rounded corners
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 370, // Set the height of the signup form container
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          // Signup form title
                          const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 30, fontFamily: "Monospace"),
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Email input field
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Email'),
                            controller: emailController,
                          ),
                          // Password input field
                          TextFormField(
                            controller: passwordController,
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText: true, // Hide the password input
                          ),
                          // Confirm Password input field
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Confirm Password'),
                            obscureText:
                                true, // Hide the confirm password input
                          ),
                          const SizedBox(height: 16),
                          // Signup button
                          ElevatedButton(
                            onPressed: () async {
                              
                            }, // Call the form submission function
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: Text('Signup'),
                            ),
                          ),
                          // Link to the login screen
                          const TextButton(
                              onPressed: null, // Navigate to the login screen
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const LoginScreen(),
                              //   ),
                              // );,
                              child: Text("Already have an account? Login"))
                        ],
                      ),
                    ),
                  ), // Display the signup form
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Define the SignupForm widget
