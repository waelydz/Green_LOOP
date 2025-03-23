import "package:flutter/material.dart";
import 'forgotpass.dart';


//to be added: make sure the password input is in the valid format


class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {

  Color c1 = const Color(0xFF3D8D7A);
  Color c2 = const Color(0xFFB3D8A8);
  Color c3 = const Color(0xFFA3D1C6);
  Color c4 = const Color(0xFFFBFFE4);

    bool _isObscure = true;


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

          //reset password text
           const Padding(
              padding: EdgeInsets.only(bottom: 40), 
              child: Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFFFBFFE4),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          

          // input new password
          SizedBox(
              width: 250,
              child: TextField(
                obscureText: _isObscure, // Toggle for password visibility
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  filled: true,
                  fillColor: c4, 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure; // Toggle state
                      });
                    },
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
      ])),);
    }
    }