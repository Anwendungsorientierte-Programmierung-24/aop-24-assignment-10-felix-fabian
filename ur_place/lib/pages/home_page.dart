// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ur_place/views/place_container.dart';
import 'package:ur_place/widgets/color_picker.dart';
import 'package:ur_place/widgets/pixel_grid.dart';

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
      body: Center(
        child: PlaceView(),
      ),
    );
  }
}
