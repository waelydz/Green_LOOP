import "package:flutter/material.dart";
import 'resetpass.dart';

//to be added: make sure the user has inputted text in the text field before they press submit and are moved to the next page
//to be added: make sure the email and password inputs are in the valid format ex: smth@org.com etc.

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
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/backicon1.png',
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //forgot password text
          const Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFFFBFFE4),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Email Input
          SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter Email",
                filled: true,
                fillColor: c4, // Background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          //submit
          SizedBox(
            width: 130,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPass()),
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
              child: const Text("Submit"),
            ),
          ),
          const SizedBox(height: 20),

          SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter Verification Code",
                filled: true,
                fillColor: c4, // Background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          //verify
          SizedBox(
            width: 130,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPass()),
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
              child: const Text("Verify"),
            ),
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
