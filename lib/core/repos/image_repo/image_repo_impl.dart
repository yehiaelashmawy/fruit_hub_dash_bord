import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dash_bord/core/errors/failures.dart';
import 'package:fruit_hub_dash_bord/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dash_bord/core/services/storage_services.dart';
import 'package:fruit_hub_dash_bord/core/utils/backend_endpoints.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageServices storageServices;
  ImageRepoImpl({required this.storageServices});
  @override
  Future<Either<Failures, String>> uploadImage(File image) async {
    try {
      return Right(
        await storageServices.uploadFile(
          path: BackendEndpoints.images,
          file: image,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
