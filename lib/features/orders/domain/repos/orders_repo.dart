import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dash_bord/core/enums/order_status_enums.dart';
import 'package:fruit_hub_dash_bord/core/errors/failures.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failures, List<OrderEntity>>> getOrdersWithOrder();

  Future<Either<Failures, void>> updateOrderStatus({
    required OrderStatusEnum status,
    required String orderId,
  });
}
