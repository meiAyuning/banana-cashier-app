import 'dart:async';
import 'dart:html';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _handleLogin() {
    String username = usernameController.text;
    String password = passwordController.text;

    // You can implement your login logic here, like sending a request to a server.

    print('Username: $username');
    print('Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Banana Login",
                style: TextStyle(
                  fontSize: 100, // Adjust the font size
                  fontWeight: FontWeight.bold, // Make it bold
                )),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
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
              onPressed: _handleLogin,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
