import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dash_bord/features/add_product/domin/entities/add_product_input_entity.dart';

import '../../errors/failures.dart';
import 'product_repo.dart';

class ProductsRepoImpe implements ProducstRepo {
  @override
  Future<Either<Failures, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
}
