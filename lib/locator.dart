import 'package:get_it/get_it.dart';
import 'package:share_a_file/managers/EmailManager.dart';
import 'package:share_a_file/services/firebase_storage_service.dart';
import 'package:share_a_file/services/twillo_service.dart';

GetIt sl = GetIt.instance;

void setUpLocator() {
  //services
  sl.registerLazySingleton<FbStorageService>(
      () => FbStorageServiceImplementation());
  sl.registerLazySingleton<TwilloService>(() => TwilloServiceImplementation());

  //managers
  sl.registerLazySingleton(() => EmailManager());
}
