import 'package:auth_firebase/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
class FirebaseUtils {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<dynamic> signUpWithEmailAndPassword(String email, String password, String name, String phoneNo) async {
    try {
      auth.UserCredential result = await auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User user = User(email: email, name: name, phoneNo: phoneNo, password: password);

      String? errorMessage = await createNewUser(user);

      if (errorMessage == null) {
        print(errorMessage);
        return user;
      } else {
        print('Failed');
        return 'Couldn\' sign up user';
      }

    } catch (e) {
      return e;
    }
  }

  static Future<String?> createNewUser(User user) async => await firestore
      .collection('users')
      .add(user.toJson())
      .then((value) => null, onError: (e) => e);

  static Future<dynamic> loginWithEmailAndPassword(String email, String password) async {

    try {
      auth.UserCredential result = await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> logOut() async {
    await auth.FirebaseAuth.instance
        .signOut();
  }
}
