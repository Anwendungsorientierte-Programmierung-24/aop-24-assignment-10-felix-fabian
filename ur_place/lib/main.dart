import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ur_place/firebase_options.dart';
import 'package:ur_place/pages/home_page.dart';
import 'package:ur_place/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase connection.
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    debugPrint('Error inititalizing Firebase.\n $e');
  }

  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UR Place',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        // Listen to authentication changes (login/logout) and 
        // ensure the user is brought to the appropriate screen.
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) { // We're logged in, go to Canvas.
            return const HomePage();
          } else { // We're not logged in, go to Login/Register
            return const LoginPage();
          }
        },
      ),
    );
  }
}
