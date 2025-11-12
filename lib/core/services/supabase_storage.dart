import 'dart:io';

import 'package:fruit_hub_dash_bord/constants.dart';
import 'package:fruit_hub_dash_bord/core/services/storage_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorage implements StorageServices {
  SupabaseClient supabaseClient = SupabaseClient(kUrl, kApiKey);

  // static createSupabaseBucket({required String bucketName}) async {
  //   var buckets = await Supabase.instance.client.storage.listBuckets();
  //   bool isBucketCreated = false;
  //   for (var bucket in buckets) {
  //     if (bucket.name == bucketName) {
  //       isBucketCreated = true;
  //       break;
  //     }
  //   }
  //   // if (!isBucketCreated) {
  //   //   final String bucketId = await Supabase.instance.client.storage
  //   //       .createBucket(bucketName);
  //   // }
  // }

  static void initSupabase() async {
    await Supabase.initialize(url: kUrl, anonKey: kApiKey);
  }

  @override
  Future<String> uploadFile({required String path, required File file}) async {
    String fileName = b.basename(file.path);
    String filePath = '${path}/$fileName';

    final storageResponse = await supabaseClient.storage
        .from(kBucket)
        .upload(filePath, file);

    final String publicUrl = await Supabase.instance.client.storage
        .from(kBucket)
        .getPublicUrl(filePath);
    return publicUrl;
  }
}
