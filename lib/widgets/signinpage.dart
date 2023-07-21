import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/widgets/button.dart';
import 'package:firebaseapp/widgets/textfield.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key, required this.onTap});

  final Function()? onTap;

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final emailtextcontroller = TextEditingController();
  final passwordtextcontroller = TextEditingController();
  final confirmpasswordtrextcontroller = TextEditingController();

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text(message)),
    );
  }

  void signup() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    // Make sure passwords match
    if (passwordtextcontroller.text != confirmpasswordtrextcontroller.text) {
      Navigator.pop(context);
      // Show error message to user
      displayMessage("Passwords don't match");
      return;
    }

    try {
      // Sign up the user with Firebase
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailtextcontroller.text,
        password: passwordtextcontroller.text,
      );

      // Registration successful, you can perform additional actions here if needed.
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Pop loading circle
      Navigator.pop(context);

      // Display error message
      displayMessage(e.message ?? "An error occurred during registration.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 50),

                // LOGO
                const Center(child: Icon(Icons.lock, size: 100)),

                // WELCOME BACK MESSAGE
                const Padding(
                  padding: EdgeInsets.fromLTRB(60, 5, 60, 30),
                  child: Card(
                    child: ListTile(
                      title: Center(
                        child: Text(
                          "HEY",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(
                          "Let's create an account for you ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // email textfield
                mytextfield(
                  controller: emailtextcontroller,
                  hinttext: 'Email',
                  obsecuretext: false,
                ),
                
                // PASSWORD TEXT FIELD
                mytextfield(
                  controller: passwordtextcontroller,
                  hinttext: 'Password',
                  obsecuretext: true,
                ),

                // CONFIRM PASSWORD TEXTFIELD
                mytextfield(
                  controller: confirmpasswordtrextcontroller,
                  hinttext: "Confirm Password",
                  obsecuretext: true,
                ),
                const SizedBox(height: 4),

                // SIGNUP BUTTON
                mybutton(
                  text: "Sign up",
                  onTap: signup,
                ),
                const SizedBox(height: 15),

                // GO TO LOGIN PAGE
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login here",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
