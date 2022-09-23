import 'package:fix_ms/services/storage_service.dart';
import 'package:get_it/get_it.dart';

void registerServices() {
  GetIt.I.registerSingletonAsync(() async {
    final service = StorageService();
    await service.init();
    return service;
  });
}