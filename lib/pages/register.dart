import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _registerUser() {
    // Implement your registration logic here.
    String email = _emailController.text;
    String password = _passwordController.text;

    // You can perform validation and registration logic here.
    // Example: Firebase authentication, API calls, etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Banana Sign Up",
                style: TextStyle(
                  fontSize: 70, // Adjust the font size
                  fontWeight: FontWeight.bold, // Make it bold
                )),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Konfirmasi Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(235, 235, 188, 34), // Background color
                onPrimary: Colors.black, // Text color
                padding:
                    EdgeInsets.all(16.0), // Padding around the button content
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Button border radius
                ),
              ),
              onPressed: _registerUser,
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: RegistrationScreen(),
    ));
