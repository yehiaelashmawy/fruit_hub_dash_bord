import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash_bord/core/helper_functions/get_order_dummy_data.dart';
import 'package:fruit_hub_dash_bord/core/helper_functions/show_snack_bar.dart';
import 'package:fruit_hub_dash_bord/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../manager/order_cubit/order_cubit.dart';

class OrderViewBlocConsumer extends StatefulWidget {
  const OrderViewBlocConsumer({super.key});

  @override
  State<OrderViewBlocConsumer> createState() => _OrderViewBlocConsumerState();
}

class _OrderViewBlocConsumerState extends State<OrderViewBlocConsumer> {
  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is OrdersGetSuccess) {
          log('Orders Get Successfully!');
          customSnackBar(context, message: 'Orders Get Successfully!');
        } else if (state is OrdersGetFailure) {
          log(state.message);
          customSnackBar(context, message: state.message);
        }
      },
      builder: (context, state) {
        if (state is OrdersGetSuccess) {
          return OrdersViewBody(orders: state.ordersList);
        } else if (state is OrdersGetFailure) {
          return Center(child: Text(state.message));
        } else if (state is OrdersLoading) {
          return Skeletonizer(
            child: OrdersViewBody(
              orders: [getDummyOrder(), getDummyOrder(), getDummyOrder()],
            ),
          );
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }
}
