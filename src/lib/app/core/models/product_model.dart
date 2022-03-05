import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final Timestamp dateCreated;
  final String title;
  final String type;
  final String description;
  final String filename;
  final int height;
  final int width;
  final double price;
  final int rating;

  ProductModel({
    required this.id,
    required this.dateCreated,
    required this.title,
    required this.type,
    required this.description,
    required this.filename,
    required this.height,
    required this.width,
    required this.price,
    required this.rating,
  });

  factory ProductModel.fromMap(String id, Map<String, dynamic>? map) =>
      ProductModel(
        id: id,
        dateCreated: map?['dateCreated'] ?? Timestamp.now(),
        title: map?['title'] ?? '',
        type: map?['type'] ?? '',
        description: map?['description'] ?? '',
        filename: map?['filename'] ?? '',
        height: map?['height'] ?? 0,
        width: map?['width'] ?? 0,
        price: map?['price'] ?? 0.0,
        rating: map?['rating'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'dateCreated': dateCreated,
        'type': type,
        'description': description,
        'filename': filename,
        'height': height,
        'width': width,
        'price': price,
        'rating': rating,
      };
}
