import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash_bord/core/enums/order_status_enums.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dash_bord/features/orders/presentation/manager/update_order/update_order_cubit.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrderStatus(
                status: OrderStatusEnum.accepted,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text('Accept'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(onPressed: () {}, child: const Text('Reject')),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.accepted,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrderStatus(
                status: OrderStatusEnum.delivered,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text('Delivered'),
          ),
        ),
      ],
    );
  }
}
