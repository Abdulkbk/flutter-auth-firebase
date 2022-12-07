import 'package:auth_firebase/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? email;
  String? name;

  Map userData = {};
  void signOut() async {
    await FirebaseUtils.logOut();
  }

  void getUser() async {
    dynamic user = FirebaseAuth.instance.currentUser;
    String userID = user.uid;
    dynamic userData = await FirebaseUtils.getUserInfo(userID);
    setState(() {
      email = userData.email;
      name = userData.name;
    });
    print(userData);
  }


  @override
  void initState() {
    super.initState();
    getUser();
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
          Text('Name: $name',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text('Email $email',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20.0,),
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
