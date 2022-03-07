import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  final double itemSize;
  final double initialRating;
  final bool ignoreGestures;
  final void Function(double) onRatingChange;

  const CustomRatingBar({
    Key? key,
    required this.itemSize,
    required this.initialRating,
    required this.ignoreGestures,
    required this.onRatingChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      glow: false,
      itemSize: itemSize,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 5,
      ignoreGestures: ignoreGestures,
      itemPadding: const EdgeInsets.only(right: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star_rounded,
        color: Colors.deepPurple,
      ),
      onRatingUpdate: onRatingChange,
    );
  }
}
