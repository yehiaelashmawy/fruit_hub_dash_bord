import 'dart:io';

import 'package:fruit_hub_dash_bord/constant.dart';
import 'package:fruit_hub_dash_bord/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;
  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseAoiKey,
    );
  }

  @override
  Future<String> uplodeFile(File file, String path) {
    // TODO: implement uplodeFile
    throw UnimplementedError();
  }
}
