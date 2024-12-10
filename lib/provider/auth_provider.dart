import 'package:breedex/view/home.dart';
import 'package:flutter/material.dart';
import 'package:breedex/navigator.dart';
import 'package:breedex/view/Auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// ignore_for_file: use_build_context_synchronously


class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? _user;
  User? get user => _user;


  // Future<void> registerWithEmailAndPassword(BuildContext context, String email, String password) async {
  //    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //   String uid = userCredential.user!.uid;
  //   try {
  //     await _firestore.collection('new_requests').doc(uid).set({
  //       'uid': uid, 
  //       'email': email, 
  //       'timestamp': FieldValue.serverTimestamp(),
  //       'status': 'pending',
  //     });


  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Your request has been sent for admin approval.')),       
  //     );
  //   Future.delayed(const Duration(seconds: 2), () {
  //   AppCustomNavigator.replace(context, const LoginScreen());
  // });
  //   } catch (e) {
  //     _showErrorSnackbar(context, 'Failed to send request: ${e.toString()}');
  //   }
  // }
  Future<void> registerWithEmailAndPassword(BuildContext context, String email, String password) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    if (user != null) {
      String uid = user.uid;

      // Save user details in Firestore
      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'email': email,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Save user registration request details
      await _firestore.collection('new_requests').doc(uid).set({
        'uid': uid,
        'email': email,
        'timestamp': FieldValue.serverTimestamp(),
        'status': 'pending',
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your request has been sent for admin approval.')),
      );

      Future.delayed(const Duration(seconds: 2), () {
        AppCustomNavigator.replace(context, const LoginScreen());
      });
    }
  } on FirebaseAuthException catch (e) {
    _showErrorSnackbar(context, e.message ?? 'An unknown error occurred');
  } catch (e) {
    _showErrorSnackbar(context, 'An unknown error occurred');
  }
}



  Future<void> loginWithEmailAndPassword(BuildContext context, String email, String password) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final User? user = userCredential.user;

    if (user != null) {
      final String uid = user.uid;

      final doc = await _firestore.collection('new_requests').doc(uid).get();

      if (doc.exists) {
        final status = doc['status'] as String;

        if (status == 'pending') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Your request is still pending approval.')),
          );
          return;
        } else if (status == 'accepted') {
          AppCustomNavigator.replace(context, const HomePage());
          return;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User record not found. Please contact admin.')),
        );
      }
    }
  } on FirebaseAuthException catch (e) {
    _showErrorSnackbar(context, e.message ?? 'An unknown error occurred');
  } catch (e) {
    _showErrorSnackbar(context, 'An unknown error occurred');
  }
}


  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      _user = null;
      notifyListeners();
    } catch (e) {
      _showErrorSnackbar(context, 'Failed to sign out');
    }
  }

  // Future<void> signInWithGoogle(BuildContext context) async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser == null) {
  //       AppCustomNavigator.replace(context, const LoginScreen());
  //       return;
  //     }

  //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     UserCredential userCredential = await _auth.signInWithCredential(credential);
  //     _user = userCredential.user;
  //     notifyListeners();
  //   } on FirebaseAuthException catch (e) {
  //     _showErrorSnackbar(context, e.message ?? 'An unknown error occurred');
  //   } catch (e) {
  //     _showErrorSnackbar(context, 'An unknown error occurred');
  //   }
  // }


  Future<void> signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      AppCustomNavigator.replace(context, const LoginScreen());
      return;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await _auth.signInWithCredential(credential);
    final User? user = userCredential.user;

    if (user != null) {
      final String uid = user.uid;
      final String email = user.email ?? '';
      final String displayName = user.displayName ?? '';
      final String photoURL = user.photoURL ?? '';

      // Check if the user's request exists in the `new_requests` collection
      final requestDoc = await _firestore.collection('new_requests').doc(uid).get();

      if (requestDoc.exists) {
        final status = requestDoc['status'] as String;
        if (status == 'pending') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Your request is still pending approval.')),
          );
          return;
        } else if (status == 'accepted') {
          AppCustomNavigator.replace(context, const HomePage());
          return;
        }
      } else {

        await _firestore.collection('new_requests').doc(uid).set({
          'uid': uid,
          'email': email,
          'timestamp': FieldValue.serverTimestamp(),
          'status': 'pending',
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Your request has been sent for admin approval.')),
        );

        await _firestore.collection('users').doc(uid).set({
          'uid': uid,
          'email': email,
          'displayName': displayName,
          'photoURL': photoURL,
          'timestamp': FieldValue.serverTimestamp(),
        });

        Future.delayed(const Duration(seconds: 2), () {
          AppCustomNavigator.replace(context, const LoginScreen());
        });
      }
    }
  } on FirebaseAuthException catch (e) {
    _showErrorSnackbar(context, e.message ?? 'An unknown error occurred');
  } catch (e) {
    _showErrorSnackbar(context, 'An unknown error occurred');
  }
}


//   Future<void> signInWithGoogle(BuildContext context) async {
//   try {
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     if (googleUser == null) {
//       AppCustomNavigator.replace(context, const LoginScreen());
//       return;
//     }

//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     UserCredential userCredential = await _auth.signInWithCredential(credential);
//     final User? user = userCredential.user;

//     if (user != null) {
//       final String uid = user.uid;
//       final String email = user.email ?? '';
//       final doc = await _firestore.collection('new_requests').doc(uid).get();

//       if (doc.exists) {
//         final status = doc['status'] as String;
//         if (status == 'pending') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Your request is still pending approval.')),
//           );
//           return;
//         } else if (status == 'accepted') {
//           AppCustomNavigator.replace(context, const HomePage());
//           return;
//         }
//       } else {
//         await _firestore.collection('new_requests').doc(uid).set({
//           'uid': uid,
//           'email': email,
//           'timestamp': FieldValue.serverTimestamp(),
//           'status': 'pending',
//         });

//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Your request has been sent for admin approval.')),
//         );

//         Future.delayed(const Duration(seconds: 2), () {
//           AppCustomNavigator.replace(context, const LoginScreen());
//         });
//       }
//     }
//   } on FirebaseAuthException catch (e) {
//     _showErrorSnackbar(context, e.message ?? 'An unknown error occurred');
//   } catch (e) {
//     _showErrorSnackbar(context, 'An unknown error occurred');
//   }
// }


  Future<void> signInWithApple(BuildContext context) async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      UserCredential userCredential = await _auth.signInWithCredential(oauthCredential);
      _user = userCredential.user;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _showErrorSnackbar(context, e.message ?? 'An unknown error occurred');
    } catch (e) {
      _showErrorSnackbar(context, 'An unknown error occurred');
    }
  }

  Future<void> sendPasswordResetEmail(BuildContext context, String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email sent')),
      );
    } on FirebaseAuthException catch (e) {
      _showErrorSnackbar(context, e.message ?? 'An unknown error occurred');
    }
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
