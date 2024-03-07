import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _authFirebase = FirebaseAuth.instance;

  Future<String?> login(String email, String password) async {
    try {
      final credential = await _authFirebase.signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        return credential.user!.uid;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      print("ERROR FIREBASE ${e.code}");
      if (e.code == "invalid-credential") {
        throw "Correo o contraseña invalida";
      }
      if (e.code == 'user-not-found') {
        throw "Usuario no encontrado";
      } else if (e.code == 'wrong-password') {
        throw "Contraseña incorrecta";
      }
    } catch (e) {
      throw e.toString();
    }
    return null;
  }

  Future<String?> register(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        return credential.user!.uid;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw "The password provided is too weak.";
      }
      if (e.code == "email-already-in-use") {
        throw "The account already exists for that email.";
      }
    } catch (e) {
      throw e.toString();
    }
    return null;
  }
}
