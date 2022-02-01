

import 'package:appsimo/Services/PatientService.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<PatientService>(()=> PatientService());
  //locator.registerLazySingleton(() => null)
}