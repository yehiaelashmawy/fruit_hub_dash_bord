import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dash_bord/core/errors/failures.dart';

abstract class ImageRepo {
  Future<Either<Failures, String>> uploadImage(File image);
}
