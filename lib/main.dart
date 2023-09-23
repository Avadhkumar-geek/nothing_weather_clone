import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing_weather_clone/data/repository/weather_repo.dart';
import 'package:nothing_weather_clone/logic/locations/locations_cubit.dart';
import 'package:nothing_weather_clone/logic/user_permission/user_permission_cubit.dart';
import 'package:nothing_weather_clone/logic/weather/weather_cubit.dart';
import 'package:nothing_weather_clone/presentation/demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepo(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherCubit(
              RepositoryProvider.of<WeatherRepo>(context),
            ),
          ),
          BlocProvider(
            create: (context) => LocationsCubit(
              RepositoryProvider.of<WeatherRepo>(context),
            ),
          ),
          BlocProvider(
            create: (context) => UserPermissionCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'RobotoMono',
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
