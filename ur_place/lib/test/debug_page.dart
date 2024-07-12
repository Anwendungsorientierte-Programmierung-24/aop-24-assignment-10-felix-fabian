import 'package:flutter/material.dart';
import 'package:ur_place/pages/home_page.dart';
import 'package:ur_place/pages/login_page.dart';
import 'package:ur_place/pages/register_page.dart';
import 'package:ur_place/test/feature_flag_manager.dart';
import 'package:ur_place/test/feature_flags_page.dart';
import 'package:ur_place/test/firebase_test_page.dart';

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  @override
  Widget build(BuildContext context) {
    List<String> runtimeOverrides =
        FFManager.getAllFeatureStates().where((feature) => FFManager.hasOverride(FeatureFlag.values[FFManager.getAllFeatureStates().indexOf(feature)])).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('⚠️ Debug Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() {}),
          ),
          IconButton(
            icon: const Icon(Icons.bug_report),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FeatureFlagsPage())),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Navigate directly to individual screens:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())),
                child: const Text('Homepage'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
                child: const Text('Login Page'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage())),
                child: const Text('Register Page'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FireBaseTestPage())),
                child: const Text('Firebase Test Page'),
              ),
              const SizedBox(height: 20),
              if (runtimeOverrides.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '🚩 Runtime Overrides:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ...runtimeOverrides.map((feature) => GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FeatureFlagsPage())),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              feature,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        )),
                  ],
                )
              else
                const Text(
                  'No runtime overrides',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
