import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tick_off/model/task_module.dart';
import 'package:uuid/uuid.dart';

class Firestore_Datasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUser(String email) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({"id": _auth.currentUser!.uid, "email": email});
      return true;
    } catch (e) {
      return true;
    }
  }

  Future<bool> AddNote(String description, String title, int image) async {
    try {
      var uuid = Uuid().v4();
      DateTime data = new DateTime.now();
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
        'time': '${data.hour}:${data.minute}',
        'title': title,
      });
      return true;
    } catch (e) {
      return true;
    }
  }

  List getNotes(AsyncSnapshot snapshot) {
    try {
      final notelist = snapshot.data.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Note(data['id'], data['description'], data['title'],
            data['time'], data['image']);
      }).toList();
      return notelist;
    } catch (e) {
      return [];
    }
  }

  Stream<QuerySnapshot> stream() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('notes')
        .snapshots();
  }
}
