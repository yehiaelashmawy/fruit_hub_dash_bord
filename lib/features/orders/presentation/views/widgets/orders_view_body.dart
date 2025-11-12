import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dash_bord/features/orders/presentation/views/widgets/filter_Row.dart';
import 'package:fruit_hub_dash_bord/features/orders/presentation/views/widgets/orders_item_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FilterRow(),
        Expanded(child: OrdersItemListView(orders: orders)),
      ],
    );
  }
}
