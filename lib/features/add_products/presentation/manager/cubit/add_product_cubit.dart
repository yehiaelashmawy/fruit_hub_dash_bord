import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash_bord/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dash_bord/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dash_bord/features/add_products/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productRepo)
    : super(AddProductInitial());
  final ProductRepo productRepo;
  final ImageRepo imageRepo;

  Future<void> addProduct({
    required AddProductInputEntity addProductInputEntity,
  }) async {
    emit(AddProductLoading());
    var response1 = await imageRepo.uploadImage(
      addProductInputEntity.productImage,
    );
    response1.fold((l) => emit(AddProductFailure(l.message)), (url) async {
      addProductInputEntity.imageUrl = url;
      var response2 = await productRepo.addProduct(addProductInputEntity);
      response2.fold(
        (l) => emit(AddProductFailure(l.message)),
        (r) => emit(AddProductSuccess()),
      );
    });
  }
}
