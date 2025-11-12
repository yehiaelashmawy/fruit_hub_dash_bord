import 'dart:io';

import 'package:fruit_hub_dash_bord/features/add_products/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String productName;
  final String productCode;
  final int productPrice;
  final String productDescription;
  final bool isFeatured;
  final File productImage;
  String? imageUrl;

  AddProductInputModel({
    required this.productName,
    required this.productCode,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
    required this.isFeatured,
    this.imageUrl,
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

      //  'reviews': reviews
    };
  }
}
