import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ur_place/widgets/color_picker.dart';
import 'package:ur_place/widgets/pixel_grid.dart';

class PlaceView extends StatefulWidget {
  const PlaceView({super.key});

  @override
  State<PlaceView> createState() => _PlaceViewState();
}

class _PlaceViewState extends State<PlaceView> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<int> _pixelColors = List.generate(100, (index) => 0); // Default to black
  static const int size = 10;
  Color _brushColor = Colors.black;
  final String _documentId = 'mzBvkuRWSE4twbGQH76n';
  Map<String, dynamic> canvas = {};

  @override
  void initState() {
    super.initState();
    _loadInitialCanvas();
  }

  void _loadInitialCanvas() async {
    DocumentSnapshot doc = await _firestore.collection('canvas').doc(_documentId).get();

    setState(() {
      // Get the current state of the canvas online, and store locally.
      canvas = doc.data() as Map<String, dynamic>;
    });
  }

  void setBrushColor(Color color) => setState(() => _brushColor = color);

  Future<void> _updatePixelColor(int index) async {
    try {
      await _firestore.collection('canvas').doc(_documentId).update(
        {
          index.toString(): ColorPicker.colors.indexOf(_brushColor),
        },
      );
    } catch (e) {
      debugPrint('Error updating pixel color: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      // Ensure we listen to any changes to the online state of the canvas, and update accordingly.
      stream: _firestore.collection('canvas').doc(_documentId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Update with online data if it's available right now.
          canvas = snapshot.data!.data() as Map<String, dynamic>;
        }

        // If we didn't get new data, we continue using the local state.
        _pixelColors = List<int>.generate(
          size * size,
          (index) => canvas[index.toString()] ?? 0,
        );

        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Position all elements with space between and around them.
            children: [
              PixelGrid(
                // Transform the integers from Firebase to their respective colors.
                pixelColors: _pixelColors.map((e) => ColorPicker.colors[e]).toList(),
                size: size,
                changed: (index) {
                  // Update
                  setState(() => _pixelColors[index] = ColorPicker.colors.indexOf(_brushColor));
                  _updatePixelColor(index);
                },
              ),
              ColorPicker(setBrushColor: (color) => setBrushColor(color), currentColor: ColorPicker.colors.indexOf(_brushColor)),
            ],
          ),
        );
      },
    );
  }
}
