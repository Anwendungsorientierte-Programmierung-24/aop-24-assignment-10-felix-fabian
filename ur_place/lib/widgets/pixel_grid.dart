// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class PixelGrid extends StatelessWidget {
  final ValueChanged _changed;
  final List<Color> _pixelColors;
  final int _size;

  const PixelGrid({required List<Color> pixelColors, required ValueChanged changed, required int size, super.key})
      : _changed = changed,
        _pixelColors = pixelColors,
        _size = size;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 300, width: 300), // Visual grid container size
      child: GridView.builder(
        itemCount: _pixelColors.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _size),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            debugPrint('Hit Row ${index ~/ _size}, Column ${index % _size}');
            _changed(index);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              color: _pixelColors[index],
            ),
          ),
        ),
      ),
    );
  }
}
