import '../../utils/date_utils.dart';
import '../../utils/money_utils.dart';
import 'product_model.dart';

class ProductListModel {
  final String id;
  final String title;
  final String image;
  final int width;
  final int height;
  final String date;
  final String type;
  final String price;
  final int rating;

  ProductListModel({
    required this.id,
    required this.title,
    required this.image,
    required this.width,
    required this.height,
    required this.date,
    required this.type,
    required this.price,
    required this.rating,
  });

  factory ProductListModel.fromProductModel(
    ProductModel product,
    String imageUrl,
  ) {
    return ProductListModel(
      id: product.id,
      title: product.title,
      image: imageUrl,
      date: fromTimestampToDateFormatted(product.dateCreated),
      width: product.width,
      height: product.height,
      type: product.type,
      price: fromNumberToPriceWithSymbol(product.price),
      rating: product.rating,
    );
  }
}
