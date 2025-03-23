import 'package:flutter/material.dart';
import 'loginpages/login.dart';
import 'loginpages/signup.dart';
import 'dart:io';
import 'dart:ui' as ui;

class Landingpage extends StatelessWidget {
  Color c1 = const Color(0xFF3D8D7A);
  Color c2 = const Color(0xFFB3D8A8);
  Color c3 = const Color(0xFFA3D1C6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c1,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //greenloop logo
          SizedBox(
            width: 250,
            height: 250,
            child: Image.asset('assets/images/Green_LOOP.png'),
          ),
          const SizedBox(height: 20),

          //sign up button
          SizedBox(
            width:200,
            child:ElevatedButton(
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
            },
              style: ElevatedButton.styleFrom(
                backgroundColor: c2, // Button color
                foregroundColor: Colors.white, // Text color
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text("Sign Up"),
            ),
          ),
          const SizedBox(height: 20),
          //log in button
          SizedBox(
            width:200,
            child:ElevatedButton(
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: c2, // Button color
              foregroundColor: Colors.white, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            child: const Text("Log in"),
          ),),
          const SizedBox(height: 20),

          //continue as guest button
          SizedBox(
            child:ElevatedButton(
            onPressed: () {
              print("Button Pressed!");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: c3, // Button color
              foregroundColor: Colors.white, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            child: const Text("Continue as guest"),
          ),),
        ]),
      ),
    );
  }
}
