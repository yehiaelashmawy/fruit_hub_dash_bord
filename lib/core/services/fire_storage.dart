import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dash_bord/core/services/storage_services.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageServices {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile({required String path, required File file}) async {
    String fileName = b.basename(file.path);

    var fileRef = storageRef.child('$path/$fileName');
    await fileRef.putFile(file);

    return await fileRef.getDownloadURL();
  }
}
