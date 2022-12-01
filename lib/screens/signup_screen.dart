import 'package:auth_firebase/screens/home_screen.dart';
import 'package:auth_firebase/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void signUp() async {
    await FirebaseUtils.signUpWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
        nameController.text.trim(),
        phoneController.text.trim());
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: w,
                    height: h * 0.2,
                    // color: Colors.green,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100.0,
                        ),
                        const Text(
                          'Create a New Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Please fill the form to continue',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.green,
                    width: w,
                    height: h * 0.55,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            controller: nameController,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 26.0,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 26.0,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                    // color: Colors.white,
                                    ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            controller: emailController,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 26.0,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 26.0,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                    // color: Colors.white,
                                    ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            controller: phoneController,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 26.0,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 26.0,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                    // color: Colors.white,
                                    ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 26.0,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 26.0,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                    // color: Colors.white,
                                    ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              suffixIcon: Icon(
                                Icons.visibility,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: h * 0.2,
                    width: w,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    // color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SizedBox(
                            width: w,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                signUp();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[700],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SizedBox(
                            width: w,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                // signUp();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                              ),
                              child: Text(
                                'Sign up with Google',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.red[500]),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Have an account? ',
                              style: const TextStyle(fontSize: 16),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.toNamed('/signin'),
                                  text: 'Sign In',
                                  style: TextStyle(
                                      color: Colors.red[500],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
