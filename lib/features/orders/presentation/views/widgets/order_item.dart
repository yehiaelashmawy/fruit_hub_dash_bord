import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/core/enums/order_status_enums.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dash_bord/features/orders/presentation/views/widgets/order_action_button.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderItem({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Total Price: \$${orderEntity.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: orderEntity.status == OrderStatusEnum.pending
                        ? Colors.orange
                        : orderEntity.status == OrderStatusEnum.accepted
                        ? Colors.green
                        : orderEntity.status == OrderStatusEnum.delivered
                        ? Colors.blue
                        : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    orderEntity.status.name,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            Text(
              'User ID: ${orderEntity.uId}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            const Text(
              'Shipping Address:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              orderEntity.shippingAddressEntity.toString(),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),

            Text(
              'Payment Method: ${orderEntity.paymentMethod}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            const Text(
              'Products:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orderEntity.orderProducts.length,
              itemBuilder: (context, index) {
                final product = orderEntity.orderProducts[index];
                return ListTile(
                  leading: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.network(
                      orderEntity.orderProducts[index].imageUrl,
                    ),
                  ),
                  title: Text(product.productName),
                  subtitle: Text(
                    'Quantity: ${product.count} | Price: \$${product.productPrice.toStringAsFixed(2)}',
                  ),
                  trailing: Text(
                    '\$${(product.productPrice * product.count).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            OrderActionButtons(orderEntity: orderEntity),
          ],
        ),
      ),
    );
  }
}
