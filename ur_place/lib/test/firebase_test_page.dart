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
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() {}),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          
          if (snapshot.hasError) {
            return Center(child: Text('Error initializing Firebase\n${snapshot.error.toString()}'));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            
            final values = snapshot.data!.options.asMap;

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Firebase is successfully connected! ✅\n'),
                  ...values.entries.map((entry) => Text('${entry.key}: ${entry.value}\n')),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
