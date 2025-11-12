import 'dart:io';

import 'package:fruit_hub_dash_bord/features/add_products/data/models/review_model.dart';
import 'package:fruit_hub_dash_bord/features/add_products/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
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
  final num count;
  final List<ReviewModel>? reviews;

  AddProductInputModel({
    required this.productName,
    required this.productCode,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
    required this.isFeatured,
    this.imageUrl,
    required this.expiryMonths,
    required this.isOrganic,
    required this.numOfCalories,
    required this.avgRating,
    required this.ratingCount,
    required this.count,
    this.reviews,
  });

  factory AddProductInputModel.fromEntity(
    AddProductInputEntity addProductInputEntity,
  ) {
    return AddProductInputModel(
      productName: addProductInputEntity.productName,
      productCode: addProductInputEntity.productCode,
      productPrice: addProductInputEntity.productPrice,
      productDescription: addProductInputEntity.productDescription,
      productImage: addProductInputEntity.productImage,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
      expiryMonths: addProductInputEntity.expiryMonths,
      isOrganic: addProductInputEntity.isOrganic,
      numOfCalories: addProductInputEntity.numOfCalories,
      avgRating: addProductInputEntity.avgRating,
      ratingCount: addProductInputEntity.ratingCount,
      count: addProductInputEntity.unitAmount,
      //  reviews: addProductInputEntity.reviews.map((e) => ReviewModel.fromEntity(e)).toList() ,
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
      'expiryMonths': expiryMonths,
      'isOrganic': isOrganic,
      'numOfCalories': numOfCalories,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'count': count,
      //  'reviews': reviews
    };
  }
}
