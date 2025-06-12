
import 'package:fruits_app_dashboard/core/services/storage_service.dart';

import 'fire_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorageService>(FireStorage());
}