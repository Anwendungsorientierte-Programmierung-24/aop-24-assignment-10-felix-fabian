import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ur_place/views/place_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UR/Place'),
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () => _auth.signOut(),
          ),
        ],
      ),
      body: const Column(
        children: [
          PlaceView(),
        ],
      ),
    );
  }
}
