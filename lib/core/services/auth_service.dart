import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final user = credential.user;

    if (user != null) {
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists && userDoc.data()?['role'] == 'Admin') {
        return user;
      } else {
        await signOut();
        throw Exception('Not an admin.');
      }
    }
    return null;
  }

  Future<void> signOut() => _auth.signOut();

  Future<bool> isAdmin() async {
    final user = _auth.currentUser;
    if (user == null) return false;

    final userDoc = await _firestore.collection('users').doc(user.uid).get();
    return userDoc.exists && userDoc.data()?['role'] == 'admin';
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
