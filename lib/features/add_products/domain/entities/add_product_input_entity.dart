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
  final int expiredMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;
  AddProductInputEntity({
    required this.productName,
    required this.productCode,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
    required this.isFeatured,
    required this.reviews,
    this.isOrganic = false,
    required this.expiredMonth,

    required this.numberOfCalories,
    required this.unitAmount,
    this.imageUrl,
  });
}
