import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final ValueChanged _changed;
  final List<Color> _colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.orange];

  ColorPicker({required ValueChanged setBrushColor, super.key}) : _changed = setBrushColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('TODO(fbraun): Color Swatch Temporary UI'),
        // TODO(fbraun): Update UI to be color grid.
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              _colors.length,
              (index) => ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: _colors[index % _colors.length]),
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
