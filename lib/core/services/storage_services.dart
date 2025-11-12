import 'dart:io';

abstract class StorageServices {
  Future<String> uploadFile({
    required String path,
    required File file,
  });
}