import 'package:dio/dio.dart';
import 'package:flutter_weather_app/controller/degree_cubit/degree_cubit.dart';
import 'package:flutter_weather_app/controller/home_cubit/home_cubit.dart';
import 'package:flutter_weather_app/controller/search_cubit/search_cubit.dart';
import 'package:flutter_weather_app/data/datasource/location_service.dart';
import 'package:flutter_weather_app/data/datasource/search_service.dart';
import 'package:flutter_weather_app/data/datasource/service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/commen/network_module.dart';
import '../../data/commen/request_interceptor.dart';
import '../../data/commen/shared_pref_module.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///shared prefs
  sl.registerSingletonAsync<SharedPreferences>(
          () => SharedPreferences.getInstance());

  sl.registerSingletonWithDependencies<SharedPreferenceModule>(
        () => SharedPreferenceModule(pref: sl<SharedPreferences>()),
    dependsOn: [SharedPreferences],
  );

  //interceptor
  sl.registerSingletonWithDependencies<RequestInterceptor>(
      () => RequestInterceptor());

  //module
  ///dio
  sl.registerLazySingleton<Dio>(
    () => NetworkModule().provideDio(),
  );

  ///cubits
  sl.registerFactory(() => HomeCubit(
        service: sl(),
        locationService: sl(),

      ));
  sl.registerFactory(() => SearchCubit(searchService: sl()));
  sl.registerFactory(() => DegreeCubit(sharedPreferenceModule: sl()));

    /// service
  sl.registerLazySingleton<Service>(() => ServiceImpl(sl()));
  sl.registerLazySingleton<LocationService>(() => LocationServiceImpl());
  sl.registerLazySingleton<SearchService>(() => SearchServiceImpl(dio: sl()));
}
