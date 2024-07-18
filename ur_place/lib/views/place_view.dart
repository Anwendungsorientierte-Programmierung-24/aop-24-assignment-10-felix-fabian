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

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> _loadInitialCanvas() async {
    DocumentSnapshot doc = await _firestore.collection('canvas').doc(_documentId).get();
    return doc.data() as Map<String, dynamic>;
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
    return FutureBuilder<Map<String, dynamic>>(
      future: _loadInitialCanvas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Error loading canvas'));
        }

        if (snapshot.hasData) {
          Map<String, dynamic> initialData = snapshot.data!;
          _pixelColors = List<int>.generate(
            size * size,
            (index) => initialData[index.toString()] ?? 0,
          );

          return StreamBuilder<DocumentSnapshot>(
            stream: _firestore.collection('canvas').doc(_documentId).snapshots(),
            builder: (context, snapshot) {

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('Error loading live canvas updates'));
              }

              if (snapshot.hasData) {
                Map<String, dynamic> liveData = snapshot.data!.data() as Map<String, dynamic>;
                _pixelColors = List<int>.generate(
                  size * size,
                  (index) => liveData[index.toString()] ?? 0,
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  PixelGrid(
                    pixelColors: _pixelColors.map((e) => ColorPicker.colors[e]).toList(),
                    size: size,
                    changed: (value) {
                      setState(() => _pixelColors[value] = ColorPicker.colors.indexOf(_brushColor));
                      _updatePixelColor(value);
                    },
                  ),
                  const SizedBox(height: 30),
                  ColorPicker(setBrushColor: (color) => setBrushColor(color), currentColor: ColorPicker.colors.indexOf(_brushColor)),
                ],
              );
            },
          );
        }

        return const Center(child: Text('No data available'));
      },
    );
  }
}
