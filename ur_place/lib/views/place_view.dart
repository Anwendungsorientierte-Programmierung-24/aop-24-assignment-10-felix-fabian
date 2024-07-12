import 'package:flutter/material.dart';
import 'package:ur_place/widgets/color_picker.dart';
import 'package:ur_place/widgets/pixel_grid.dart';

class PlaceView extends StatefulWidget {
  const PlaceView({super.key});

  @override
  State<PlaceView> createState() => _PlaceViewState();
}

class _PlaceViewState extends State<PlaceView> {
  //TODO(fbraun): Hook this up to firebase.
  //TODO(fbraun): Implement pixel placement cooldown.

  static int _size = 10;
  List<Color> _pixelColors = List.generate(100, (index) => Colors.black);

  Color _brushColor = Colors.red;

  void setBrushColor(Color color) => setState(() => _brushColor = color);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // mainAxisSize: MainAxisSize.max,
      children: [
        PixelGrid(
          pixelColors: _pixelColors,
          size: _size,
          changed: (value) => setState(() => _pixelColors[value] = _brushColor),
        ),
        SizedBox(height: 50),
        ColorPicker(setBrushColor: (color) => setBrushColor(color)),
      ],
    );
  }
}
