// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ur_place/pages/home_page.dart';
import 'package:ur_place/pages/login_page.dart';
import 'package:ur_place/pages/register_page.dart';
import 'package:ur_place/test/feature_flag_manager.dart';
import 'package:ur_place/test/feature_flags_page.dart';

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('⚠️ Debug Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.bug_report),
            onPressed: () => setState(() {}),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Navigate directly to individual screens.'),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              ),
              child: Text('Homepage'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              ),
              child: Text('Login Page'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ),
              ),
              child: Text('Register Page'),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[Text('🚩 FeatureFlags:')] +
                  List.generate(
                    FeatureFlagManager.getAllFeatureStates().length,
                    (index) => GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FeatureFlagsPage())),
                      child: Text(
                        FeatureFlagManager.getAllFeatureStates()[index],
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
