import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {

  final ValueChanged<Color> _changed;
  late int _currentColor;

  static final List<Color> colors = [Colors.white, Colors.black, Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.orange, Colors.purple];

  ColorPicker({
    required ValueChanged<Color> setBrushColor,
    required int currentColor,
    super.key,
  })  : _changed = setBrushColor,

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Number of columns
          childAspectRatio: 2.0, // appearence of the boxes
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: ColorPicker.colors.length,
        itemBuilder: (context, index) {
          Color borderColor;
          if (index == widget._currentColor) {
            // shows which color is active rn
            borderColor = Colors.grey;
          } else {
            borderColor = Colors.transparent;
          }

          return GestureDetector(
            onTap: () {
              setState(() => widget._currentColor = index); // We store the current color locally so we can update our visual selection
              widget._changed(ColorPicker.colors[index]);
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: ColorPicker.colors[index],
                border: Border.all(
                  color: borderColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        },
      ),
    );
  }
}
