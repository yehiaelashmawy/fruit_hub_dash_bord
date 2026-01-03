import 'dart:io';

import 'package:fruit_hub_dash_bord/features/add_products/data/models/review_model.dart';
import 'package:fruit_hub_dash_bord/features/add_products/domain/entities/product_entity.dart';

class ProductModel {
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
  final List<ReviewModel> reviews;

  ProductModel({
    required this.productName,
    required this.productCode,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
    required this.reviews,
    required this.isFeatured,
    this.isOrganic = false,

    required this.expiredMonth,
    required this.numberOfCalories,
    required this.unitAmount,
    this.imageUrl,
  });

  factory ProductModel.fromEntity(ProductEntity addProductInputEntity) {
    return ProductModel(
      productName: addProductInputEntity.productName,
      productCode: addProductInputEntity.productCode,
      productPrice: addProductInputEntity.productPrice,
      productDescription: addProductInputEntity.productDescription,
      productImage: addProductInputEntity.productImage,
      isFeatured: addProductInputEntity.isFeatured,
      isOrganic: addProductInputEntity.isOrganic,
      reviews: addProductInputEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
      imageUrl: addProductInputEntity.imageUrl,
      expiredMonth: addProductInputEntity.expiredMonth,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
    );
  }

  toMap() {
    return {
      'productName': productName,
      'productCode': productCode,
      'productPrice': productPrice,
      'productDescription': productDescription,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expiredMonth': expiredMonth,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
