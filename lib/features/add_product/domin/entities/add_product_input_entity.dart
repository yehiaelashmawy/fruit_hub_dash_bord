import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String description;
  final String code;
  final File image;
  final num price;
  final bool isFeatured;
  File? imageUrl;

  AddProductInputEntity({
    required this.name,
    required this.description,
    required this.code,
    required this.image,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
  });
}
