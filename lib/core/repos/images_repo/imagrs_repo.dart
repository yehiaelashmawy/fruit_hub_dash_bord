import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../errors/failures.dart';

abstract class ImagesRepo {
  Future<Either<Failures, File>> uploadImage(File image);
}
