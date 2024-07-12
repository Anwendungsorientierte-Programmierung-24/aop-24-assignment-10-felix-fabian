import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_place/data/auth_service.dart';

class FireBaseTestPage extends StatefulWidget {
  const FireBaseTestPage({super.key});

  @override
  State<FireBaseTestPage> createState() => _FireBaseTestPageState();
}

class _FireBaseTestPageState extends State<FireBaseTestPage> {
  late Future<FirebaseApp> _initialization;

  late AuthService test;

  @override
  void initState() {
    super.initState();
    test = Provider.of<AuthService>(context, listen: false);
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
                children: <Widget>[
                  const Text('Firebase is successfully connected! ✅\n'),
                  ...values.entries.map((entry) => Text('${entry.key}: ${entry.value}\n')).followedBy([
                    Text('Provider -------------------'),
                    Text(test.test()),
                  ]),
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
