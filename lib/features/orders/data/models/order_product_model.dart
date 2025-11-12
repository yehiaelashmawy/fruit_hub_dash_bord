import 'package:fruit_hub_dash_bord/features/orders/domain/entities/order_product_entity.dart';

class OrderProductModel {
  final String productName;
  final String productCode;
  final String imageUrl;
  final double productPrice;
  final int count;

  OrderProductModel({
    required this.productName,
    required this.productCode,
    required this.imageUrl,
    required this.productPrice,
    required this.count,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      productName: json['productName'],
      productCode: json['productCode'],
      imageUrl: json['imageUrl'],
      productPrice: json['productPrice'].toDouble(),
      count: json['count'],
    );
  }

  OrderProductEntity toEntity() {
    return OrderProductEntity(
      productName: productName,
      productCode: productCode,
      imageUrl: imageUrl,
      productPrice: productPrice,
      count: count,
    );
  }

  toJson() {
    return {
      'productName': productName,
      'productCode': productCode,
      'imageUrl': imageUrl,
      'productPrice': productPrice,
      'count': count,
    };
  }
}
