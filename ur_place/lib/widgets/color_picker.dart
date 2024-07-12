import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final ValueChanged _changed;
  ColorPicker({required ValueChanged setBrushColor, super.key}): _changed = setBrushColor;

  List<Color> _colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors. orange];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Color Swatch Placeholder'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              5,
              (index) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _colors[index%_colors.length],
                ),
                onPressed: () => _changed(_colors[index]),
                child: Text('Color $index'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
