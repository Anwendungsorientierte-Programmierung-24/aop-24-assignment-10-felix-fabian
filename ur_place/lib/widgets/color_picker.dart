import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final ValueChanged _changed;
  
  static final List<Color> colors = [Colors.black, Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.orange];


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
              colors.length,
              (index) => ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: colors[index % colors.length]),
                onPressed: () => _changed(colors[index]),
                child: Text('Color $index'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
