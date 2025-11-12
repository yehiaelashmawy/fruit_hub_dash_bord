import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/entities/order_entity.dart';

class ShowOrder extends StatelessWidget {
  const ShowOrder({super.key, required this.orderEntity});
  final OrderEntity? orderEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        orderEntity == null
            ? const Text('No Orders')
            : Text(orderEntity!.orderProducts.first.productName),
        const SizedBox(height: 10),
        orderEntity == null
            ? const Text('No Orders')
            : Text(orderEntity!.orderProducts.first.productPrice.toString()),
        const SizedBox(height: 10),
        orderEntity == null
            ? const Text('No Orders')
            : Text(orderEntity!.orderProducts.first.productCode),
        const SizedBox(height: 10),
        orderEntity == null
            ? const Text('No Orders')
            : Text(orderEntity!.orderProducts.first.count.toString()),
        const SizedBox(height: 16),
        orderEntity == null
            ? const Text('No Orders')
            : Image.network(orderEntity!.orderProducts.first.imageUrl),
      ],
    );
  }
}
