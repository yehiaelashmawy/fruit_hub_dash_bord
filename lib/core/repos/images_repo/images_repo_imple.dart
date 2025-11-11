import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dash_bord/core/repos/images_repo/imagrs_repo.dart';
import 'package:fruit_hub_dash_bord/core/services/storage_service.dart';
import 'package:fruit_hub_dash_bord/core/utils/backend_endpoint.dart';

class ImagesRepoImple implements ImagesRepo {
  final StorageService storageService;
  ImagesRepoImple(this.storageService);
  @override
  Future<Either<Exception, File>> uploadImage(File image) async {
    try {
      String url = await storageService.uplodeFile(
        image,
        BackendEndpoint.images,
      );

      return right(File(url));
    } catch (e) {
      return left(Exception(e));
    }
  }
}
