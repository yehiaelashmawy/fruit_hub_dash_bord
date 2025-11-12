import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.ordersRepo) : super(OrdersInitial());
  final OrdersRepo ordersRepo;

  StreamSubscription? subscription;

  void getOrders() {
    emit(OrdersLoading());
    subscription = ordersRepo.getOrdersWithOrder().listen((orders) {
      orders.fold(
        (l) => emit(OrdersGetFailure(message: l.message)),
        (r) => emit(OrdersGetSuccess(ordersList: r)),
      );
    });
  }

  Future<void> dispose() {
    subscription?.cancel();
    return super.close();
  }
}
