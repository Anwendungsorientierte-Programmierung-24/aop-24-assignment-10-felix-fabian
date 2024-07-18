import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final ValueChanged _changed;
  late int _currentColor;

  static final List<Color> colors = [Colors.white, Colors.black, Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.orange];

  ColorPicker({required ValueChanged setBrushColor, required int currentColor, super.key}) : _changed = setBrushColor, _currentColor = currentColor;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              ColorPicker.colors.length,
              (index) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPicker.colors[index % ColorPicker.colors.length],
                  foregroundColor: index == widget._currentColor ? Colors.yellow : null,
                ),
                onPressed: () {
                  setState(() => widget._currentColor = index); // We store the current color locally so we can update our visual selection.
                  widget._changed(ColorPicker.colors[index]);
                },
                child: Text('Color $index'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
