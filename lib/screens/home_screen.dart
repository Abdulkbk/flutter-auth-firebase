import 'package:auth_firebase/services/authentication.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void signOut() async {
    await FirebaseUtils.logOut();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SizedBox(
              width: w,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  signOut();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                child: const Text(
                  'Sign out',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
