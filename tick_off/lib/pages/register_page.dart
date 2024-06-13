import 'package:flutter/material.dart';
import 'package:tick_off/components/my_loginbtn.dart';
import 'package:tick_off/components/my_textfield.dart';

import 'home_page.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  //text editing controllers
  final newusernameController = TextEditingController();
  final newpasswordController = TextEditingController();

  void signIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo
                const Icon(
                  Icons.lock,
                  color: Colors.black,
                  size: 100,
                ),

                //Please sign up
                const SizedBox(height: 50),
                const Text(
                  'Lets get you Registered!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                //new user textfield
                MyTextField(
                    controller: newusernameController,
                    hintText: 'Enter your new username',
                    obsecureText: false),

                const SizedBox(height: 10),

                //new password textfield
                MyTextField(
                    controller: newpasswordController,
                    hintText: 'Enter your new password',
                    obsecureText: false),

                const SizedBox(height: 10),

                //confirm password textfield
                MyTextField(
                    controller: newpasswordController,
                    hintText: 'Confirm your new password',
                    obsecureText: false),

                const SizedBox(height: 25),
                MyLoginBtn(
                  onTap: () => signIn(context),
                  buttonText: 'Register',
                ),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' Or Continue with  ',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
