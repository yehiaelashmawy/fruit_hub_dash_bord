import 'package:fruit_hub_dash_bord/core/enums/order_status_enums.dart';
import 'package:fruit_hub_dash_bord/features/orders/data/models/order_product_model.dart';
import 'package:fruit_hub_dash_bord/features/orders/data/models/shipping_address_model.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String date;
  final String? status;
  final String orderId;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.date,
    required this.status,
    required this.orderId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    totalPrice: json['totalPrice'].toDouble(),
    uId: json['uID'],
    shippingAddressModel: ShippingAddressModel.fromJson(
      json['shippingAddressModel'],
    ),
    orderProducts: List<OrderProductModel>.from(
      json['orderProducts'].map((e) => OrderProductModel.fromJson(e)),
    ),
    paymentMethod: json['paymentMethod'],
    date: json['date'],
    status: json['status'],
    orderId: json['orderId'],
  );

  OrderEntity toEntity() => OrderEntity(
    totalPrice: totalPrice,
    uId: uId,
    shippingAddressEntity: shippingAddressModel.toEntity(),
    orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
    paymentMethod: paymentMethod,
    date: date,
    status: fetchEnum(),
    orderId: orderId,
  );

  toJson() => {
    'totalPrice': totalPrice,
    'uId': uId,
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
    'date': date,
    'status': status,
  };

  OrderStatusEnum fetchEnum() {
    return OrderStatusEnum.values.firstWhere((e) {
      var enumStatus = e.name.toString();
      return enumStatus == (status ?? 'pending');
    });
  }
}
