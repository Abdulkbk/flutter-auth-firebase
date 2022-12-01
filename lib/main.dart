import 'package:auth_firebase/screens/home_screen.dart';
import 'package:auth_firebase/screens/signin_screen.dart';
import 'package:auth_firebase/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signin',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/signin', page: () => const SignInScreen()),
        GetPage(name: '/signup', page: () => const SignUpScreen()),
      ],
      title: 'Auth Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
