// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ur_place/views/place_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Column(
        children: [
          const Text('TODO(fbraun): Not final UI.', style: TextStyle(color: Colors.red,fontSize: 20)),
          SizedBox(height: 150),
          Center(
            child: PlaceView(),
          ),
        ],
      ),
    );
  }
}
