import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash_bord/core/services/get_it_services.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/repos/orders_repo.dart';
import 'package:fruit_hub_dash_bord/features/orders/presentation/manager/order_cubit/order_cubit.dart';
import 'package:fruit_hub_dash_bord/features/orders/presentation/manager/update_order/update_order_cubit.dart';
import 'package:fruit_hub_dash_bord/features/orders/presentation/views/widgets/orders_view_bloc_consumer.dart';
import 'package:fruit_hub_dash_bord/features/orders/presentation/views/widgets/update_order_bloc_consumer.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const routeName = 'orders';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OrderCubit(getIt.get<OrdersRepo>())),
        BlocProvider(
          create: (context) => UpdateOrderCubit(getIt.get<OrdersRepo>()),
        ),
      ],

      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Orders')),
        body: const UpdateOrderBlocConsumer(child: OrderViewBlocConsumer()),
      ),
    );
  }
}
