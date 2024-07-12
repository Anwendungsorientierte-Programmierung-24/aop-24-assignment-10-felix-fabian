import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_place/data/auth_service.dart';

class FireBaseStatusTestPage extends StatefulWidget {
  const FireBaseStatusTestPage({super.key});

  @override
  State<FireBaseStatusTestPage> createState() => _FireBaseStatusTestPageState();
}

class _FireBaseStatusTestPageState extends State<FireBaseStatusTestPage> {
  late AuthService test;

  @override
  void initState() {
    super.initState();
    test = Provider.of<AuthService>(context, listen: false);
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                const Text('⚠️ Firebase Status Information\n\n'),
                const Text('Current User -------------------\n'),
              ] +
              List.generate(
                test.currentUser.toString().split(', ').length,
                (index) => Text(test.currentUser.toString().split(', ')[index]),
              ) +
              [
                const Text('\n\nFirebase App -------------------\n'),
                Text(
                  test.currentApp.options.toString().replaceAll(', ', '\n'),
                ),
              ],
        ),
      ),
    );
  }
}
