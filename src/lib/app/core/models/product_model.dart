class ProductModel {
  final String title;
  final String type;
  final String description;
  final String filename;
  final double height;
  final double width;
  final double price;
  final int rating;

  ProductModel({
    required this.title,
    required this.type,
    required this.description,
    required this.filename,
    required this.height,
    required this.width,
    required this.price,
    required this.rating,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        title: map['title'],
        type: map['type'],
        description: map['description'],
        filename: map['filename'],
        height: map['height'],
        width: map['width'],
        price: map['price'],
        rating: map['rating'],
      );
}
