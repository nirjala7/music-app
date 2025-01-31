import 'package:flutter/material.dart';
import 'homepage.dart';
import 'signin_page.dart'; // Import the SignIn page

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Colors
    final backgroundColor = Color(0xFF121111);
    final textColor = Color(0xFFFFFFFF);
    final buttonColor = Color(0xFF059FB4);
    final signUpColor = Color(0xFF7CEEFF);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // Logo
            Container(
              width: screenWidth,
              height: screenHeight * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/Images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // "Login to your account"
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Login to your account',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Email input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: textColor),
                  filled: true,
                  fillColor: Color(0xFF333333),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  labelStyle: TextStyle(color: textColor),
                  hintStyle: TextStyle(color: textColor),
                ),
                style: TextStyle(color: textColor),
              ),
            ),
            SizedBox(height: 16),
            // Password input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: textColor),
                  filled: true,
                  fillColor: Color(0xFF333333),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  labelStyle: TextStyle(color: textColor),
                  hintStyle: TextStyle(color: textColor),
                ),
                style: TextStyle(color: textColor),
              ),
            ),
            // Remember me checkbox
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value ?? false;
                        if (_rememberMe) {
                          // Save email for later (you can use SharedPreferences for persistence)
                          print('Email saved: ${_emailController.text}');
                        }
                      });
                    },
                    activeColor: buttonColor,
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
            ),
            // Login button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
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
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Forgot Password text
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text(
                  'Forgot the password?',
                  style: TextStyle(
                    color: signUpColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Horizontal divider with "or continue with" text
            Row(
              children: [
                Expanded(child: Divider(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'or continue with',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(child: Divider(color: Colors.white)),
              ],
            ),
            // Social media buttons (Google and Facebook)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.0,
                    child: IconButton(
                      icon: Image.asset('lib/Images/google.png'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.0,
                    child: IconButton(
                      icon: Image.asset('lib/Images/facebook.png'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Sign Up link at the bottom
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigate to SignIn page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                child: Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    color: signUpColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
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
