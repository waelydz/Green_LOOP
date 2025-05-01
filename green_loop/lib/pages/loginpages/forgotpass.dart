import "package:flutter/material.dart";
import 'resetpass.dart';

//to be added: make sure the user has inputted text in the text field before they press submit and are moved to the next page
//to be added: make sure the email and password inputs are in the valid format ex: smth@org.com etc.

// ignore: must_be_immutable
class Forgotpass extends StatelessWidget {
  Color c1 = const Color(0xFF3D8D7A);
  Color c2 = const Color(0xFFB3D8A8);
  Color c3 = const Color(0xFFA3D1C6);
  Color c4 = const Color(0xFFFBFFE4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c1,
      appBar: AppBar(
        backgroundColor: c1,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                iconSize: 24,
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //forgot password text
                const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFFFBFFE4),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                // Email Input
                Container(
                  decoration: BoxDecoration(
                    color: c4,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                //submit
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResetPass()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: c2,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 5,
                    ),
                    child: const Text("Submit"),
                  ),
                ),
                const SizedBox(height: 35),

                // Verification Code Input
                Container(
                  decoration: BoxDecoration(
                    color: c4,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Verification Code",
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                //verify
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResetPass()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: c2,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 5,
                    ),
                    child: const Text("Verify"),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
