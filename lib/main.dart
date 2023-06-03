import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/controller/degree_cubit/degree_cubit.dart';
import 'package:flutter_weather_app/controller/home_cubit/home_cubit.dart';
import 'package:flutter_weather_app/controller/search_cubit/search_cubit.dart';
import 'package:flutter_weather_app/core/utils/theme/theme.dart';
import 'package:flutter_weather_app/view/splash_screen.dart';
import 'core/services/service_locator.dart' as di;

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> di.sl<HomeCubit>()..getCityWeather()),
        BlocProvider(create: (context)=> di.sl<SearchCubit>()),
        BlocProvider(create: (context)=> di.sl<DegreeCubit>(),),
      ],
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
