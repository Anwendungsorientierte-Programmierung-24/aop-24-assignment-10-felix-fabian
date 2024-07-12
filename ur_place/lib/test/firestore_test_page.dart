import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireStoreTestPage extends StatefulWidget {
  const FireStoreTestPage({super.key});

  @override
  State<FireStoreTestPage> createState() => _FireStoreTestPageState();
}

class _FireStoreTestPageState extends State<FireStoreTestPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Debug Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Firebase Connection Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            user != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'User Info:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text('User Email: ${user.email}'),
                      Text('User ID: ${user.uid}'),
                    ],
                  )
                : const Text(
                    'No user is currently logged in.',
                    style: TextStyle(fontSize: 16),
                  ),
            const SizedBox(height: 20),
            const Text(
              'Firestore Collections:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            FutureBuilder(
              future: _firestore.collectionGroup('canvas').limit(5).get(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Text('No collections found.');
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: snapshot.data!.docs.map((doc) {
                      return Text('Collection: ${doc.reference.path}');
                    }).toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
