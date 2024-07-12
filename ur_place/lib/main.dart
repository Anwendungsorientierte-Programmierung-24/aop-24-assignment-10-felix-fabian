import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_place/firebase_options.dart';
import 'package:ur_place/pages/home_page.dart';
import 'package:ur_place/pages/login_page.dart';
import 'package:ur_place/test/debug_page.dart';
import 'package:ur_place/test/feature_flag_manager.dart';

import 'data/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    debugPrint('Error inititalizing Firebase.\n $e');
  }

  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UR Place',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FFManager.isEnabled(FeatureFlag.enableDebugPage)
          ? const DebugPage()
          : StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const HomePage();
                } else {
                  return const LoginPage();
                }
              },
            ),
    );
  }
}
