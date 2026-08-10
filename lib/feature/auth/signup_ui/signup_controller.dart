import 'package:firebase_auth/firebase_auth.dart';

class SignupController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> register({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      return _getErrorMessage(e.code);
    } catch (e) {
      return 'Something went wrong';
    }
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already registered';

      case 'invalid-email':
        return 'Invalid email address';

      case 'weak-password':
        return 'Password is too weak';

      case 'operation-not-allowed':
        return 'Email and password registration is not enabled';

      default:
        return 'Something went wrong';
    }
  }
}
