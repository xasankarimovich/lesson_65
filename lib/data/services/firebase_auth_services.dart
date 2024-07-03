import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final authFirebaseServices = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    try {
      UserCredential userCredential = await authFirebaseServices.signInWithEmailAndPassword(
        email: email,
        password: password,

      );
      User? user = userCredential.user;
      if (user != null) {
        print('Foydalanuvchi: ${user.email}');
      }
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'user-recaptcha-expired') {
        // Foydalanuvchidan reCaptcha jarayonini qayta bajarishni so'rash===============
        print('reCaptcha tokeni muddati tugagan. Qayta urining.');
        await reauthenticate(email, password);
      } else {
        print('Xato: $e');
      }
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await authFirebaseServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await authFirebaseServices.signOut();
    } catch (e) {
      rethrow;
    }
  }
  Future<void> reauthenticate(String email, String password) async {
    try {
      User? user = authFirebaseServices.currentUser;
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

        UserCredential userCredential = await user.reauthenticateWithCredential(credential);

        // Muvaffaqiyatli qayta autentifikatsiya amalga oshirildi
        print('Qayta autentifikatsiya amalga oshirildi: ${userCredential.user?.email}');
      } else {
        print('Foydalanuvchi tizimga kirmagan.');
      }

    } catch (e) {
      print('Xato: $e');
    }
}}
