import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dash_bord/core/errors/failures.dart';
import 'package:fruit_hub_dash_bord/features/add_products/domain/entities/add_product_input_entity.dart';

abstract class ProductRepo {
  Future<Either<Failures, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  );
}
