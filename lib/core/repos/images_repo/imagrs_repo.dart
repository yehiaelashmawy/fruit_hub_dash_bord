import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class ImagesRepo {
  Future<Either<Exception, File>> uploadImage(File image);
}
