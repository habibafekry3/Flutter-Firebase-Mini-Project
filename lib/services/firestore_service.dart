import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Save a record for the currently signed-in user.
  Future<void> addRecord({
    required String name,
    required int age,
    required String hobby,
  }) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('You must be logged in to save a record.');
    }

    await _firestore.collection('records').add({
      'name': name.trim(),
      'age': age,
      'hobby': hobby.trim(),
      'userId': user.uid,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Get records belonging to the currently signed-in user.
  Stream<QuerySnapshot<Map<String, dynamic>>> getRecords() {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('You must be logged in to view records.');
    }

    return _firestore
        .collection('records')
        .where('userId', isEqualTo: user.uid)
        .snapshots();
  }
}
