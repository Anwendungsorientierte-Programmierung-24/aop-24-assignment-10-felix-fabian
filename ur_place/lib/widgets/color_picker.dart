import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Color Swatch Placeholder'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            5,
            (index) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                surfaceTintColor: Color(index*50%255),
              ),
              onPressed: () => null,
              child: Text('Color $index'),
            ),
          ),
        ),
      ],
    );
  }
}
