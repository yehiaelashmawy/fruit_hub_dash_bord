import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dash_bord/core/services/database_service.dart';
import 'package:fruit_hub_dash_bord/features/add_product/data/models/add_product_input_model.dart';
import 'package:fruit_hub_dash_bord/features/add_product/domin/entities/add_product_input_entity.dart';

import '../../errors/failures.dart';
import '../../utils/backend_endpoint.dart';
import 'product_repo.dart';

class ProductsRepoImpe implements ProducstRepo {
  final DatabaseService databaseService;

  ProductsRepoImpe(this.databaseService);
  @override
  Future<Either<Failures, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.addProductCollection,
        data: AddProductInputModel.fromEntity(addProductInputEntity).tojason(),
      );

      return right(null);
    } catch (e) {
      return left(ServerFailure('Failed to add product'));
    }
  }
}
