import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ur_place/firebase_options.dart';
import 'package:ur_place/pages/home_page.dart';
import 'package:ur_place/test/debug_page.dart';
import 'package:ur_place/test/feature_flag_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (FFManager.isEnabled(FeatureFlag.enableFirebase)) {
    try {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    } catch (e) {
      debugPrint('Error inititalizing Firebase.\n $e');
    }
  }
  runApp(const MyApp());
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
      home: FFManager.isEnabled(FeatureFlag.enableDebugPage) ? const DebugPage() : const HomePage(),
    );
  }
}
