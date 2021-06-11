//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
//
// class GoogleSignInProvider extends ChangeNotifier {
//
//   final googleSignIn = GoogleSignIn();
//   GoogleSignInAccount _guser;
//   GoogleSignInAccount get user => _guser;
//
//   Future googleLogin()async{
//     final googleUser = await googleSignIn.signIn();
//     if(googleUser == null)return;
//     _guser = googleUser;
//
//     final googleAuth = await googleUser.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken
//     );
// await FirebaseAuth.instance.signInWithCredential(credential);
// notifyListeners();
//   }
//
//
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:flutter_church/pages/sign_in.dart';
// // import 'google_signin.dart';
// // import 'package:provider/provider.dart';
// //
// //
// // class GoogleAccount extends StatelessWidget {
// //   const GoogleAccount({Key key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) => Scaffold (
// //    body: ChangeNotifierProvider(
// //      create: (context) =>GoogleSignInProvider(),
// //      child: SignIn(),
// //    )
// //   );
// // }
