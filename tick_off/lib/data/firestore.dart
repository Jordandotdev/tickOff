import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class Firestore_Datasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUser(String email) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({"id": _auth.currentUser!.uid, "email": email});
    } catch (e) {
      // Consider logging the error or handling it differently
      throw Exception('Failed to create user: $e');
    }
  }

  Future<void> AddNote(String description, String title, int image) async {
    try {
      var uuid = Uuid().v4();
      DateTime now = DateTime.now();
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .set({
        "id": uuid,
        "description": description,
        "isDone": false,
        'image': image,
        'time': now,
        'title': title,
      });
    } catch (e) {
      throw Exception('Failed to add note: $e');
    }
  }
}
