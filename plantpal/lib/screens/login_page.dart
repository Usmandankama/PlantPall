import 'package:flutter/material.dart';
import 'package:plantpal/screens/signupScreen.dart';

import '../main.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./assets/images/login-bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Top section: App title
            Expanded(
              child: Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate back to the startup screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StartUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
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
            ),
            // Bottom section: Login form
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(1),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: const Center(
                child: LoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      // For now, let's just print the email and password
      print('Email: $_email');
      print('Password: $_password');
    }
  }

  String dropdownvalue = "Admin";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Login form fields
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, fontFamily: "Monospace"),
                  ),
                  DropdownButton(
                    value: dropdownvalue,
                    items: const [
                      DropdownMenuItem(
                        value: "Admin",
                        child: Text(
                          "Admin",
                          style:
                              TextStyle(fontSize: 20, fontFamily: "Monospace"),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "User",
                        child: Text(
                          "User",
                          style:
                              TextStyle(fontSize: 20, fontFamily: "Monospace"),
                        ),
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onChanged: (value) {
                _email = value;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onChanged: (value) {
                _password = value;
              },
            ),
            const SizedBox(height: 20),
            // Login button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (dropdownvalue == "User") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }
                });
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Text(
                  'Login',
                ),
              ),
            ),
            // "Sign Up" button
            TextButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                  );
                });
                // Navigate to the signup screen
              },
              child: const Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
