import 'dart:io';

import 'package:fruit_hub_dash_bord/constant.dart';
import 'package:fruit_hub_dash_bord/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;
  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseAoiKey,
    );
  }

  @override
  Future<String> uplodeFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String exetionName = b.extension(file.path);
    var result = await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName.$exetionName', file);

    return result;
  }
}
