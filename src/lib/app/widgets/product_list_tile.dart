import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/models/product_list_model.dart';
import 'custom_rating_bar.dart';
import 'product_item_dropdown.dart';

class ProductListTile extends StatefulWidget {
  final ProductListModel product;
  final void Function() onEdit;
  final void Function() onDelete;

  const ProductListTile({
    Key? key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<ProductListTile> createState() => _ProductListTileState();
}

class _ProductListTileState extends State<ProductListTile> {
  bool showDate = false;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        setState(() {
          showDate = !showDate;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 3.0),
              blurRadius: 12.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: widget.product.id,
                child: CachedNetworkImage(
                  imageUrl: widget.product.image,
                  width: 85,
                  height: 85,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ProductListTitle(
                      product: widget.product,
                      onEdit: widget.onEdit,
                      onDelete: widget.onDelete,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.product.type,
                      style: _textTheme.subtitle1?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    _ProductListInfo(product: widget.product),
                    const SizedBox(height: 8.0),
                    showDate
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Text(widget.product.date),
                          )
                        : const SizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductListTitle extends StatelessWidget {
  final ProductListModel product;
  final void Function() onEdit;
  final void Function() onDelete;

  const _ProductListTitle({
    Key? key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            product.title,
            style: _textTheme.titleLarge?.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ProductItemDropwdown(
          onEdit: onEdit,
          onDelete: onDelete,
        ),
      ],
    );
  }
}

class _ProductListInfo extends StatelessWidget {
  final ProductListModel product;

  const _ProductListInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRatingBar(
          itemSize: 25.0,
          initialRating: product.rating.toDouble(),
          ignoreGestures: true,
          onRatingChange: (_) {},
        ),
        Flexible(
          child: Text(
            product.price,
            style: _textTheme.subtitle1,
          ),
        ),
      ],
    );
  }
}
