import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final ValueChanged<Color> _changed;
  late int _currentColor;

  static final List<Color> colors = [
    Colors.white,
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
  ];

  ColorPicker({
    required ValueChanged<Color> setBrushColor,
    required int currentColor,
    super.key,
  })  : _changed = setBrushColor,
        _currentColor = currentColor;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        childAspectRatio: 1.0, // Aspect ratio of each item
      ),
      itemCount: ColorPicker.colors.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() => widget._currentColor = index); // We store the current color locally so we can update our visual selection.
            widget._changed(ColorPicker.colors[index]);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorPicker.colors[index],
              border: Border.all(
                color: index == widget._currentColor ? Colors.yellow : Colors.transparent,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      },
    );
  }
}
