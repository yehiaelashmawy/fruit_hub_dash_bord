import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dash_bord/core/enums/order_status_enums.dart';
import 'package:fruit_hub_dash_bord/core/errors/failures.dart';
import 'package:fruit_hub_dash_bord/core/services/database_services.dart';
import 'package:fruit_hub_dash_bord/core/utils/backend_endpoints.dart';
import 'package:fruit_hub_dash_bord/features/orders/data/models/order_model.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dash_bord/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseServices databaseServices;

  OrdersRepoImpl({required this.databaseServices});

  @override
  Stream<Either<Failures, List<OrderEntity>>> getOrdersWithOrder() async* {
    try {
      await for (var (data as List<Map<String, dynamic>>)
          in databaseServices.getStreamData(path: BackendEndpoints.orders)) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> updateOrderStatus({
    required OrderStatusEnum status,
    required String orderId,
  }) async {
    try {
      databaseServices.updateData(
        path: BackendEndpoints.updateOrders,
        data: {'status': status.name},
        documentId: orderId,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
