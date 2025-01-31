import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'homepage.dart'; // Import the HomePage.dart file

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
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Padding above logo
                SizedBox(height: screenHeight * 0.1),
                // Logo
                Container(
                  height: 120.0,
                  width: screenWidth * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/Images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
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
                SizedBox(height: screenHeight * 0.05),
                // Continue with Google Button
                SizedBox(
                  width: screenWidth - 40,
                  height: screenHeight * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to HomePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/Images/google.png',
                          height: 24.0,
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
                SizedBox(height: 10),
                // Continue with Facebook Button
                SizedBox(
                  width: screenWidth - 40,
                  height: screenHeight * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to HomePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/Images/facebook.png',
                          height: 24.0,
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
                SizedBox(height: screenHeight * 0.03),
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
                SizedBox(height: screenHeight * 0.03),
                // Log in with a password button
                SizedBox(
                  width: screenWidth - 40,
                  height: screenHeight * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to LoginPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blueButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Log In with Email',
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
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
