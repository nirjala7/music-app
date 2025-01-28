import 'package:flutter/material.dart';
import 'loginpage.dart'; // Import the LoginPage.dart file

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Colors
    final backgroundColor = Color(0xFF121111);
    final textColor = Color(0xFFFFFFFF);
    final buttonColor = Color(0xFF1E1E1E);
    final blueButtonColor = Color(0xFF06A0B5);
    final signUpColor = Color(0xFF7CEEFF);

    return Scaffold(
      backgroundColor: backgroundColor, // Background color for the screen
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Padding above logo
                SizedBox(
                    height: screenHeight * 0.1), // Increased padding for logo
                Container(
                  height: 120.0,
                  width: screenWidth *
                      0.6, // Decrease width to add more side padding
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'lib/Images/logo.png'), // Replace with actual image
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Padding below logo

                // "Let's get you in" Text
                Text(
                  'Let\'s get you in',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05), // Spacer

                // Continue with Google Button
                SizedBox(
                  width: screenWidth -
                      40, // Full width with padding (20px on each side)
                  height: screenHeight * 0.06, // Button height
                  child: ElevatedButton(
                    onPressed: () {
                      // Google sign-in functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Border radius
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/Images/google.png', // Smaller Google icon
                          height: 24.0, // Adjust the size of the icon
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Continue with Google',
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10), // Spacer

                // Continue with Facebook Button
                SizedBox(
                  width: screenWidth -
                      40, // Full width with padding (20px on each side)
                  height: screenHeight * 0.06, // Button height
                  child: ElevatedButton(
                    onPressed: () {
                      // Facebook sign-in functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Border radius
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/Images/facebook.png', // Smaller Facebook icon
                          height: 24.0, // Adjust the size of the icon
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Continue with Facebook',
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Spacer

                // Horizontal line with "or" text
                Row(
                  children: [
                    Expanded(child: Divider(color: textColor)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'or',
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: textColor)),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03), // Spacer

                // Log in with a password button
                SizedBox(
                  width: screenWidth -
                      40, // Full width with padding (20px on each side)
                  height: screenHeight * 0.06, // Button height
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to LoginPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LoginPage(), // Navigate to LoginPage.dart
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blueButtonColor, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Border radius
                      ),
                    ),
                    child: Text(
                      'Log In with Email',
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Spacer

                // Don't have an account? Sign Up text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Sign Up page
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: signUpColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
