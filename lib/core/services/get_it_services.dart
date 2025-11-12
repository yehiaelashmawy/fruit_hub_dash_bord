import 'package:fruit_hub_dash_bord/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dash_bord/core/repos/product_repo/product_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../../features/orders/data/repos/orders_repo_impl.dart';
import '../../features/orders/domain/repos/orders_repo.dart';
import '../repos/image_repo/image_repo.dart';
import '../repos/image_repo/image_repo_impl.dart';
import 'database_services.dart';
import 'firestore_services.dart';
import 'storage_services.dart';
import 'supabase_storage.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageServices>(SupabaseStorage());
  getIt.registerSingleton<ImageRepo>(
    ImageRepoImpl(storageServices: getIt.get<StorageServices>()),
  );
  getIt.registerSingleton<DatabaseServices>(FirestoreServices());
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(databaseServices: getIt.get<DatabaseServices>()),
  );
  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(databaseServices: getIt.get<DatabaseServices>()),
  );
}
