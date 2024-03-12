import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final _cloudFirebase = FirebaseFirestore.instance;

  Future create(Map<String, dynamic> data, String idUser) async {
    try {
      await _cloudFirebase.collection("users").doc(idUser).set(data);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Map<String, dynamic>> get(String idUser) async {
    try {
      final response = await _cloudFirebase.collection("users").doc(idUser).get();

      return response.data() ?? {};
    } catch (e) {
      throw e.toString();
    }
  }
}
