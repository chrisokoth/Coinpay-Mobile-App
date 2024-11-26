// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coinpay_clone/pages/login.dart';
import 'package:flutter/material.dart';

import 'sign_up.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center image
            Image.asset(
              'lib/images/wallet.png', // Replace with your image asset path
              height: 350,
              width: 150,
            ),
            SizedBox(height: 20), // Space between image and text

            // Main title
            Text(
              'Create Your Coinpay Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10), // Space between title and subtext

            // Subtext
            Text(
              'Coinpay is a powerful tool that allows you to easily send, receive and track all your transactions.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40), // Space before buttons

            // Sign Up button
            SizedBox(
              width: double.infinity, // Full width
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Sign Up page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()), // Replace with your Sign Up page
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Sign Up'),
              ),
            ),
            SizedBox(height: 20), // Space between buttons

            // Log In button
            SizedBox(
              width: double.infinity, // Full width
              child: OutlinedButton(
                onPressed: () {
                  // Navigate to Log In page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()), // Replace with your Log In page
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.blue), // Blue border
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Colors.white, // White background
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(color: Colors.blue), // Blue text color
                ),
              ),
            ),
            SizedBox(height: 40), // Space below buttons

            // Terms of service and privacy policy text
            Text(
              'By continuing, you accept the terms of service and privacy policy.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}