import 'package:fruit_hub_dash_bord/core/services/storage_service.dart';
import 'package:fruit_hub_dash_bord/core/services/supabase_storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
}
