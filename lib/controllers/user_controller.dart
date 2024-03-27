import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthUserControllerGoogle {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static User? get user => _auth.currentUser;

  static signOut() async {
    await _auth.signOut();
    await _googleSignIn
        .signOut(); // Thêm dòng này để đăng xuất khỏi Google SignIn
  }

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }

  static Future<String?> imageAccount() async {
    User? currentUser = _auth.currentUser;
    return currentUser?.photoURL; // Trả về URL ảnh đại diện của người dùng
  }

  static Future<void> saveUserData(User? user) async {
    if (user != null) {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      await users.doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        'photoURL': user.photoURL,
      });
    }
  }
}
