import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nothing_weather_clone/data/constants/colors.dart';
import 'package:nothing_weather_clone/data/constants/constants.dart';
import 'package:nothing_weather_clone/data/constants/svg_path.dart';
import 'package:nothing_weather_clone/data/models/forecast_model.dart';
import 'package:nothing_weather_clone/data/models/weather_model.dart';
import 'package:nothing_weather_clone/logic/user_permission/user_permission_cubit.dart';
import 'package:nothing_weather_clone/logic/weather/weather_cubit.dart';
import 'package:nothing_weather_clone/presentation/error_screen/error_screen.dart';
import 'package:nothing_weather_clone/presentation/home_screen/widgets/card.dart';
import 'package:nothing_weather_clone/presentation/home_screen/widgets/forecast_widget.dart';
import 'package:nothing_weather_clone/presentation/home_screen/widgets/my_header_delegate.dart';
import 'package:nothing_weather_clone/presentation/home_screen/widgets/rounded_widget.dart';
import 'package:nothing_weather_clone/presentation/locations_screen/locations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = 'MY LOCATION';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          city.toUpperCase(),
          style: const TextStyle(fontSize: 15),
        ),
        backgroundColor: kSecondaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu_outlined),
          onPressed: () {
            _navigateToLocations();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svg/settings.svg',
                width: 22,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<UserPermissionCubit, UserPermissionState>(
        builder: (context, permissionState) {
          return BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state.status == WeatherStatus.initial) {
                context.read<UserPermissionCubit>().getUserPermission();
                if (permissionState.status == PermissionStatus.deniedForever ||
                    permissionState.status == PermissionStatus.denied) {
                  return const ErrorScreen();
                }
                if (permissionState.status == PermissionStatus.always ||
                    permissionState.status == PermissionStatus.whileInUse) {
                  context.read<WeatherCubit>().fetchWeather(permissionState.positionKey);
                }
              }

              if (state.status == WeatherStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              }

              if (state.status == WeatherStatus.failure) {
                return const ErrorScreen();
              }

              if (state.status == WeatherStatus.success) {
                final weather = state.weather!;
                final forecast = state.forecast!;
                return buildWeatherScreen(weather, forecast);
              }

              return const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              );
            },
          );
        },
      ),
    );
  }

  _navigateToLocations() async {
    final city = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LocationsScreen()));

    updateCity(city);
  }

  updateCity(String city) {
    setState(() {
      this.city = city;
    });
  }

  Widget buildWeatherScreen(WeatherModel weather, ForecastModel forecast) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: kSecondaryColor,
          expandedHeight: 488,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 118),
                    child: Column(
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            getSvgPath(weather.weatherText!.toLowerCase(), weather.isDayTime!)!,
                            height: 200,
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          weather.weatherText!.toUpperCase(),
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPersistentHeader(
          delegate: MyHeaderDelegate(weather: weather, forecast: forecast),
          pinned: true,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(right: 24.0, left: 24.0),
            child: ForecastWidget(forecast: forecast),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        SliverToBoxAdapter(
          child: buildCardsGrid(forecast, weather),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        SliverToBoxAdapter(
          child: SvgPicture.asset(
            'assets/svg/accuweather.svg',
            width: 100,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
      ],
    );
  }

  Widget buildCardsGrid(ForecastModel forecast, WeatherModel weather) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0, left: 24.0),
      child: GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 18,
          childAspectRatio: 0.991,
        ),
        children: [
          MyCard(
              image: 'assets/svg/air_quality.svg',
              title: 'AIR QUALITY',
              subTitle: forecast.dailyForecasts![0].airAndPollen![0].category,
              data: forecast.dailyForecasts![0].airAndPollen![0].categoryValue.toString()),
          MyCard(
              image: 'assets/svg/humidity.svg',
              title: 'HUMIDITY',
              data: '${weather.relativeHumidity!}%'),
          MyCard(
              image: 'assets/svg/wind.svg',
              title: 'WIND SPEED',
              data: weather.wind!.speed!.metric!.value!.round().toString(),
              windDegree: weather.wind!.direction!.degrees,
              units: 'KM/H'),
          MyCard(
              image: 'assets/svg/uv_index.svg',
              title: 'UV INDEX',
              subTitle: weather.uVIndexText,
              data: '0${weather.uVIndex.toString()}'),
          MyCard(
            image: weather.isDayTime! ? 'assets/svg/sunset.svg' : 'assets/svg/sunrise.svg',
            title: weather.isDayTime! ? 'SUNSET' : 'SUNRISE',
            data: (() {
              if (weather.isDayTime!) {
                final date = epochToDateTime(forecast.dailyForecasts![0].sun!.epochSet!);
                return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
              } else {
                final date = epochToDateTime(forecast.dailyForecasts![1].sun!.epochRise!);
                return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
              }
            }()),
          ),
          RoundedWidget(
            txt1: 'FEELS LIKE',
            txtSize1: 13,
            txtWeight1: FontWeight.w300,
            txt2: '${weather.realFeelTemperature!.metric!.value!.round().toString()}°',
            txtSize2: 50,
            txtWeight2: FontWeight.w200,
          ),
        ],
      ),
    );
  }
}
