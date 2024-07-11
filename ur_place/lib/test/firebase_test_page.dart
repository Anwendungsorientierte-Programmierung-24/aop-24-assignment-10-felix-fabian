import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FireBaseTestPage extends StatefulWidget {
  const FireBaseTestPage({super.key});

  @override
  State<FireBaseTestPage> createState() => _FireBaseTestPageState();
}

class _FireBaseTestPageState extends State<FireBaseTestPage> {
  late Future<FirebaseApp> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      appBar: AppBar(
        title: const Text("⚠️ Debug: Firebase"),
      ),
    
      body: FutureBuilder(
    
        future: _initialization,
    
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            return const Center(child: Text("Error initializing Firebase"));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return const Center(child: Text("Firebase is successfully connected!"));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
