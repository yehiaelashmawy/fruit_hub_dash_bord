class OrderProductEntity {
  final String productName;
  final String productCode;
  final String imageUrl;
  final double productPrice;
  final int count;

  OrderProductEntity({
    required this.productName,
    required this.productCode,
    required this.imageUrl,
    required this.productPrice,
    required this.count,
  });
}