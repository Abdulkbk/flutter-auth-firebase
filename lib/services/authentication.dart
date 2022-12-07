import 'package:auth_firebase/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class FirebaseUtils {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<dynamic> signUpWithEmailAndPassword(
      String email, String password, String name, String phoneNo) async {
    try {
      auth.UserCredential result = await auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User user =
          User(email: email, name: name, phoneNo: phoneNo, password: password, userID: result.user?.uid ?? '');

      dynamic errorMessage = await saveUserDetails(user);

      if (errorMessage == null) {
        return user;
      } else {
        print('Failed');
        return 'Could\' sign up user';
      }

    } catch (e) {
      return e;
    }
  }

  static Future<String?> createNewUser(User user) async => await firestore
      .collection('users')
      .add(user.toJson())
      .then((value) => null, onError: (e) => e);

  static Future saveUserDetails(User user) async {
    await firestore
        .collection('users')
        .doc(user.userID)
        .set(user.toJson())
        .then((value) => print('User saved'))
        .catchError((err) => print('Failed to add user'));
  }

  static Future<dynamic> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      auth.UserCredential result = await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firestore.collection('users').doc(result.user?.uid ?? '').get();

      User? user;

      if (documentSnapshot.exists) {
        user = User.fromJson(documentSnapshot.data()?? {});
      }
      return user;
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> logOut() async {
    await auth.FirebaseAuth.instance.signOut();
  }

  static Future<dynamic> getUserInfo(String id) async {
    DocumentSnapshot<Map<String, dynamic>> userData =
        await firestore.collection('users').doc(id).get();
    if (userData.data() != null && userData.exists) {
      return User.fromJson(userData.data()!);
    } else {
      return null;
    }
  }
}
