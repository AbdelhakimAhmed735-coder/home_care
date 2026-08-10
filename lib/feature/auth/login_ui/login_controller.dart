import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_care/feature/auth/login_ui/auth_services.dart';

class LoginController {
  final AuthService _authService = AuthService();

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _authService.login(email: email, password: password);

      return null;
    } on FirebaseAuthException catch (e) {
      return _getErrorMessage(e.code);
    } catch (e) {
      return 'Something went wrong';
    }
  }

  Future<String?> forgotPassword(String email) async {
    try {
      await _authService.forgotPassword(email);

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Something went wrong';
    } catch (e) {
      return 'Something went wrong';
    }
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found with this email';

      case 'wrong-password':
        return 'Wrong password';

      case 'invalid-credential':
        return 'Invalid email or password';

      case 'invalid-email':
        return 'Invalid email address';

      case 'user-disabled':
        return 'This account has been disabled';

      default:
        return 'Something went wrong';
    }
  }
}
