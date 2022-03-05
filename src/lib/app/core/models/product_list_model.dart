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

  ProductListModel({
    required this.id,
    required this.title,
    required this.image,
    required this.width,
    required this.height,
    required this.date,
    required this.type,
    required this.price,
  });

  factory ProductListModel.fromProductModel(ProductModel product) =>
      ProductListModel(
        id: product.id,
        title: product.title,
        image: product.filename,
        date: fromTimestampToDateFormatted(product.dateCreated),
        width: product.width,
        height: product.height,
        type: product.type,
        price: fromNumberToPriceFormatted(product.price),
      );
}
