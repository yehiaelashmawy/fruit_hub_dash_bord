import 'package:fruit_hub_dash_bord/core/repos/images_repo/images_repo_imple.dart';
import 'package:fruit_hub_dash_bord/core/repos/images_repo/imagrs_repo.dart';
import 'package:fruit_hub_dash_bord/core/repos/products_repo/products_repo_impe.dart';
import 'package:fruit_hub_dash_bord/core/services/storage_service.dart';
import 'package:fruit_hub_dash_bord/core/services/supabase_storage_service.dart';
import 'package:get_it/get_it.dart';

import '../repos/products_repo/product_repo.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImple(getIt.get<StorageService>()),
  );
  getIt.registerSingleton<ProducstRepo>(ProductsRepoImpe());
}
