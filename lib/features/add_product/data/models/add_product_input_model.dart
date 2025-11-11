import 'dart:io';

import '../../domin/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String description;
  final String code;
  final File image;
  final num price;
  final bool isFeatured;
  File? imageUrl;

  AddProductInputModel({
    required this.name,
    required this.description,
    required this.code,
    required this.image,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
  });

  factory AddProductInputModel.fromEntity(
    AddProductInputEntity addProductInputEntity,
  ) => AddProductInputModel(
    name: addProductInputEntity.name,
    description: addProductInputEntity.description,
    code: addProductInputEntity.code,
    image: addProductInputEntity.image,
    price: addProductInputEntity.price,
    isFeatured: addProductInputEntity.isFeatured,
    imageUrl: addProductInputEntity.imageUrl,
  );

  tojason() {
    return {
      'name': name,
      'description': description,
      'code': code,
      'image': image,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
    };
  }
}
