// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class PixelGrid extends StatefulWidget {
  const PixelGrid({super.key});

  @override
  State<PixelGrid> createState() => _PixelGridState();
}

class _PixelGridState extends State<PixelGrid> {
  
  static int size = 10;

  List<Widget> _pixels = List.generate(
    size * size,
    (index) => GestureDetector(
      onTap: () => debugPrint('Hit Row ${index~/size}, Column ${index%size}'),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.5),
          color: Colors.red,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 300, width: 300), // Visual grid container size
      child: GridView.builder(
        itemCount: _pixels.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size),
        itemBuilder: (context, index) => _pixels[index],
      ),
    );
  }
}
