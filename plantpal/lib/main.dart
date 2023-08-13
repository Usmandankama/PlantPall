import 'package:flutter/material.dart';
import 'package:plantpal/constants.dart';

// Import the other screens used in the app
import 'screens/SignupScreen.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Disable the debug banner in the top-right corner
      debugShowCheckedModeBanner: false,
      title: 'Plant Shop',
      theme: ThemeData(
        primaryColor: primaryColor,
        buttonTheme: const ButtonThemeData(
          buttonColor: primaryColor,
        ),
        // title: IconButton(icon: Icons.shopping_cart,onPressed:(){},),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Specify the startup screen as the home screen of the app
      home: const StartUpScreen(),
    );
  }
}

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({Key? key}) : super(key: key);

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background image container
      body: Container(
        // Background image decoration
        decoration: const BoxDecoration(
          image: DecorationImage(
            // Load the background image
            image: AssetImage("./assets/images/Vayu.jpg"),
            // Scale the image to cover the entire container
            fit: BoxFit.cover,
          ),
        ),
        // Column layout for the startup screen content
        child: Column(
          children: [
            // App title at the top
            const Padding(
              padding: EdgeInsets.only(top: 160, bottom: 10),
              child: Center(
                child: Text(
                  "PlantPal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontFamily: "Cursive",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            // Subtitles below the app title
            const Text(
              "Your personal",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              "Plant care helper",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            // Login Button
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(primaryColor)),
                onPressed: () {
                  // Navigate to the login screen when the "Login" button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text("Login"),
                  ),
                ),
              ),
            ),
            // Sign Up Button
            ElevatedButton(
              // Customize the button appearance with a semi-transparent background
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.grey.withOpacity(.6)),
              ),
              onPressed: () {
                // Navigate to the signup screen when the "Sign Up" button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupScreen(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
