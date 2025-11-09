import '../../../features/add_product/domin/entities/add_product_input_entity.dart';

abstract class ProducstRepo {
  Future<void> addProduct(AddProductInputEntity addProductInputEntity);
}
