import 'dart:io';

import 'package:fruit_hub_dash_bord/features/add_products/domain/entities/review_entity.dart';

class AddProductInputEntity {
  final String productName;
  final String productCode;
  final int productPrice;
  final String productDescription;
  final bool isFeatured;
  final File productImage;
  String? imageUrl;
  final int expiryMonths;
  final bool isOrganic;
  final int numOfCalories;
  final num avgRating;
  final num ratingCount;
  final num unitAmount;
  final List<ReviewEntity>? reviews;
  AddProductInputEntity({
    required this.productName,
    required this.productCode,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
    required this.isFeatured,
    this.imageUrl,
    required this.expiryMonths,
    this.isOrganic = false,
    required this.numOfCalories,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.unitAmount,
    this.reviews,
  });
}
