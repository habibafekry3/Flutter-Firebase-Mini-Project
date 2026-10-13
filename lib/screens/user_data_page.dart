import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(title: const Text('My Records'), centerTitle: true),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: firestoreService.getRecords(),
        builder: (context, snapshot) {
          // Show a loading indicator while fetching records.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Display an error if something goes wrong.
          if (snapshot.hasError) {
            return const Center(child: Text('Failed to load records.'));
          }

          final records = snapshot.data?.docs ?? [];

          // Show a message when no records exist.
          if (records.isEmpty) {
            return const Center(
              child: Text(
                'You have no records yet.',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          // Display the user's records.
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: records.length,
            itemBuilder: (context, index) {
              final data = records[index].data();

              final name = data['name'] as String? ?? '';
              final age = data['age'] as int? ?? 0;
              final hobby = data['hobby'] as String? ?? '';

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Age: $age\nFavourite Hobby: $hobby'),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
