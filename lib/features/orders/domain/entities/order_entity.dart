import 'package:fruit_hub_dash_bord/core/enums/order_status_enums.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final String date;
  final OrderStatusEnum status;
  final String orderId;

  OrderEntity({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressEntity,
    required this.orderProducts,
    required this.paymentMethod,
    required this.date,
    required this.status,
    required this.orderId,
  });
}
