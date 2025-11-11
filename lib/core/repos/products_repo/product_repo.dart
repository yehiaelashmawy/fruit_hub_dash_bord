import 'package:dartz/dartz.dart';

import '../../../features/add_product/domin/entities/add_product_input_entity.dart';
import '../../errors/failures.dart';

abstract class ProducstRepo {
  Future<Either<Failures, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  );
}
