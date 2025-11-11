import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:fruit_hub_dash_bord/core/repos/products_repo/product_repo.dart';
import 'package:meta/meta.dart';

import '../../../../core/repos/images_repo/imagrs_repo.dart';
import '../../domin/entities/add_product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productRepo)
    : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProducstRepo productRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductInputEntity.image);

    result.fold(
      (f) {
        emit(AddProductFailure(f.message));
      },
      (url) async {
        addProductInputEntity.imageUrl = url;

        var result = await productRepo.addProduct(addProductInputEntity);
        result.fold(
          (f) {
            emit(AddProductFailure(f.message));
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
