// Import necessary packages and dependencies
import 'package:flutter/material.dart';
import 'package:plantpal/screens/login_page.dart'; // Import the login page
import '../main.dart'; // Import the main app (assuming this file is in the same directory)

// Define the SignupScreen widget
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

// State class for the SignupScreen widget
class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Set the background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./assets/images/catamaran.jpg"), // Placeholder image path
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
              child: const Center(
                child: SignupForm(), // Display the signup form
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Define the SignupForm widget
class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

// State class for the SignupForm widget
class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>(); // Key for the signup form

  String _email = ''; // Store the email input
  String _password = ''; // Store the password input
  String _confirmPassword = ''; // Store the confirm password input

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform signup logic here
      // For now, let's just print the email and password
      print('Email: $_email');
      print('Password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370, // Set the height of the signup form container
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey, // Associate the form key with the form
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Signup form title
            const Center(
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 30, fontFamily: "Monospace"),
              ),
            ),
            const SizedBox(height: 5),
            // Email input field
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onChanged: (value) {
                _email = value; // Update the email variable when input changes
              },
            ),
            // Password input field
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true, // Hide the password input
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onChanged: (value) {
                _password = value; // Update the password variable when input changes
              },
            ),
            // Confirm Password input field
            TextFormField(
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true, // Hide the confirm password input
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _password) {
                  return 'Passwords do not match';
                }
                return null;
              },
              onChanged: (value) {
                _confirmPassword = value; // Update the confirm password variable when input changes
              },
            ),
            const SizedBox(height: 16),
            // Signup button
            ElevatedButton(
              onPressed: _submitForm, // Call the form submission function
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Text('Signup'),
              ),
            ),
            // Link to the login screen
            TextButton(
                onPressed: () {
                  // Navigate to the login screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text("Already have an account? Login"))
          ],
        ),
      ),
    );
  }
}
