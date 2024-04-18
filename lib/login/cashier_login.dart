import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sushires_project/login/auth.dart';
import 'package:sushires_project/components/appbackground.dart';
import 'package:sushires_project/components/sushibarlogo.dart';

class Cashier_Login extends StatefulWidget {
  const Cashier_Login({super.key});

  @override
  State<Cashier_Login> createState() => _Cashier_LoginState();
}

class _Cashier_LoginState extends State<Cashier_Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isObscure = true; // Declare the controller
  String? errorMessage = "";
  bool isLogin = true;

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return Text(errorMessage == ' ' ? '' : ' $errorMessage');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AppBackGround(
          childWidget: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SushiBarLogo(),
                    Container(
                      child: Image.asset('images/logo.png'),
                    ),
                    Container(
                      child: Text(
                        "Waiter Login",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFECE0E0),
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      padding: EdgeInsets.all(20),
                      width: 300,
                      height: 300,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller:
                                emailController, // Text editing controller for username
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons
                                  .person), // Optional icon for username field
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Rounded border
                              ),
                            ),
                            keyboardType: TextInputType
                                .text, // Set keyboard type for username input
                            autocorrect:
                                false, // Disable autocorrect for username
                            textInputAction: TextInputAction
                                .next, // Move to next field on enter
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null; // No error if validation passes
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons
                                  .lock), // Optional icon for password field
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Rounded border
                              ),
                              suffixIcon: IconButton(
                                icon: (isObscure)
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons
                                        .visibility), // Toggle password visibility
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                              ),
                            ),
                            keyboardType: TextInputType
                                .visiblePassword, // Set keyboard type for password
                            obscureText:
                                isObscure, // Use correct property name (lowercase 't')
                            textInputAction: TextInputAction.done,
                            onEditingComplete: () {
                              if (isObscure &&
                                  passwordController.text.isNotEmpty) {
                                // Simulate backspace behavior for first character deletion
                                passwordController.text =
                                    passwordController.text.substring(1);
                              }
                            }, // Submit on enter (optional)
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null; // No error if validation passes
                            },
                          ),
                          Expanded(
                            child: _errorMessage(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 100, // Adjust width and height as desired
                            height: 50,
                            child: FloatingActionButton(
                              onPressed: isLogin
                                  ? signInWithEmailAndPassword
                                  : createUserWithEmailAndPassword,
                              backgroundColor: Colors.orange,
                              child: Text(
                                'LogIn',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
