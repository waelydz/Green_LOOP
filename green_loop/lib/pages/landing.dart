import 'package:flutter/material.dart';
import 'loginpages/login.dart';
import 'loginpages/signup.dart';
import 'homepage.dart';

class LandingPage extends StatelessWidget {
  // Changed to PascalCase
  static const Color primaryColor = Color(0xFF3D8D7A);
  static const Color secondaryColor = Color(0xFFB3D8A8);
  static const Color accentColor = Color(0xFFA3D1C6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset('assets/images/Green_LOOP.png'),
                ),
                const SizedBox(height: 50),
                _buildButton(context, "Sign Up", secondaryColor, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                }),
                const SizedBox(height: 20),
                _buildButton(context, "Log in", secondaryColor, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                }),
                const SizedBox(height: 20),
                _buildButton(context, "Continue as guest", accentColor, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 220,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 6,
          shadowColor: Colors.black45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
