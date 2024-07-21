
import 'package:flutter/material.dart';

class PixelGrid extends StatelessWidget {
  final ValueChanged _changed; // Notify parent of tapped pixel.
  final List<Color> _pixelColors; // List of Colors.
  final int _size; // Define canvas length/height.

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
        physics: const NeverScrollableScrollPhysics(), // Prevent the grid from scrolling.
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _size),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => _changed(index), // Inform parent that a pixel needs to be updated with current brush color.
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
