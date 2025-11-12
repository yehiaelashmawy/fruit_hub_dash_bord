import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dash_bord/features/orders/presentation/views/widgets/order_item.dart';

class OrdersItemListView extends StatelessWidget {
  const OrdersItemListView({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => OrderItem(orderEntity: orders[index]),
      itemCount: orders.length,
    );
  }
}
