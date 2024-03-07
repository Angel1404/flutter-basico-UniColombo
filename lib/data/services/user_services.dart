import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final _cloudFirebase = FirebaseFirestore.instance;

  create(Map<String, dynamic> data) {
    try {
      _cloudFirebase.collection("users").add(data).then(
            (document) => document.update({"id": document.id}),
          );
    } catch (e) {
      throw e.toString();
    }
  }
}
