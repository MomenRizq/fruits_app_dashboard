
import 'package:fruits_app_dashboard/core/repos/images_repo/images_repo_imp.dart';
import 'package:fruits_app_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_app_dashboard/core/repos/products_repo/products_repo_imp.dart';
import 'package:fruits_app_dashboard/core/services/database_services.dart';
import 'package:fruits_app_dashboard/core/services/fireStroe_services.dart';
import 'package:fruits_app_dashboard/core/services/storage_service.dart';

import '../repos/images_repo/images_repo.dart';
import 'fire_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorageService>(FireStorage());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
    getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(getIt.get<StorageService>()));
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(getIt.get<DatabaseServices>()));
}