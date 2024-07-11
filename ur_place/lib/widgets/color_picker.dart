import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
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
                onPressed: () => null,
                child: Text('Color $index'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
