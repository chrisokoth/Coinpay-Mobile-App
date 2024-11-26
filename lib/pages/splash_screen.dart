// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coinpay_clone/pages/register.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //current page index
  int _currentIndex = 0;

  //create a list of onboarding texts
  final List<String> _texts = [
    'Trusted by Millions of People, part of one part',
    'Spend Money Abroad',
    'Receive Money from Anywhere In The World',
  ];

  //list of images assets corresponding to each step

  final List<String> _images = [
    'lib/images/image1.png',
    'lib/images/image2.jpeg',
    'lib/images/image3.jpeg',
  ];

  //page controller to control the PageView
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //Pageview to show onboarding steps
          Expanded(
              child: PageView.builder(
            controller: _pageController, //controller for the PageView
            itemCount: _texts.length, //number of onboarding steps
            onPageChanged: (index) {
              //update the curent index when the page changes
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              //build each onboarding step
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //display the image for the current step
                  Image.asset(
                      _images[index], //loads image based on current index
                      height: 200,
                      width: 200),
                  SizedBox(height: 20), //add space between image and text
                  //Display the text for the current step
                  Text(
                    _texts[index], //load text based on current step
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          )),

          //Progress indicator
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the progress indicators
            children: List.generate(_texts.length, (index) {
              // Create a dot for each onboarding step
              return Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 4), // Space between dots
                width: 12, // Width of the dot
                height: 12, // Height of the dot
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Make the dot circular
                  color: _currentIndex == index
                      ? Colors.blue // Active dot color
                      : Colors.grey, // Inactive dot color
                ),
              );
            }),
          ),

          SizedBox(height: 20), // Add space below the progress indicator
          // Next button to navigate through onboarding steps
          SizedBox(
            width: double.infinity, // Make button take full width
            child: ElevatedButton(
              onPressed: () {
                // Check if the current index is the last step
                if (_currentIndex < _texts.length - 1) {
                  // If not the last step, go to the next step
                  _currentIndex++;
                  _pageController.animateToPage(
                    _currentIndex,
                    duration: Duration(milliseconds: 300), // Animation duration
                    curve: Curves.easeIn, // Animation curve
                  );
                } else {
                  // If it's the last step, navigate to the registration page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Register()), // Replace with your registration page
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set button color to blue
                padding: EdgeInsets.symmetric(
                    vertical: 16), // Increase vertical padding for size
                textStyle: TextStyle(
                  fontSize: 18, // Increase font size
                ),
              ),
              child: Text(_currentIndex < _texts.length - 1
                  ? 'Next'
                  : 'Get Started'), // Button text
            ),
          ),
          SizedBox(height: 40), // Add space below the button
        ],
      ),
    );
  }
}
