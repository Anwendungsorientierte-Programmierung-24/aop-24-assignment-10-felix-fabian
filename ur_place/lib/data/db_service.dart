import 'package:cloud_firestore/cloud_firestore.dart';

class DbService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String documentId;

  DbService({required this.documentId});

  Stream<Map<String, dynamic>> get pixelGridStream {
    return _firestore.collection('canvas').doc(documentId).snapshots().map((snapshot) {
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        return {};
      }
    });
  }
  Future<void> updatePixelColor(int pixelIndex, String newColor) async {
    try {
      await _firestore.collection('canvas').doc(documentId).update({
        pixelIndex.toString(): newColor,
      });
    } catch (e) {
      print('Error updating pixel color: $e');
    }
  }
  Future<void> initializeEmptyCanvas(int width, int height, String defaultColor) async {
    try {
      Map<String, String> initialPixels = {};
      for (int i = 0; i < width * height; i++) {
        initialPixels[i.toString()] = defaultColor;
      }
      await _firestore.collection('canvas').doc(documentId).set(initialPixels);
    } catch (e) {
      print('Error initializing canvas: $e');
    }
  }
}