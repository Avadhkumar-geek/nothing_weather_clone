import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing_weather_clone/data/constants/colors.dart';
import 'package:nothing_weather_clone/logic/locations/locations_cubit.dart';
import 'package:nothing_weather_clone/logic/weather/weather_cubit.dart';
import 'package:nothing_weather_clone/presentation/demo.dart';
import 'package:nothing_weather_clone/presentation/locations_screen/locations_search_screen.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationsCubit, LocationsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kSecondaryColor,
          appBar: AppBar(
            backgroundColor: kSecondaryColor,
            surfaceTintColor: Colors.transparent,
            title: const Text(
              "LOCATIONS",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            actions: [
              IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LocationsSearchScreen(),
                      )),
                  icon: const Icon(Icons.add_outlined, color: kPrimaryColor))
            ],
            centerTitle: true,
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
                child: ListTile(
                  title: Text(
                    'My location',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Divider(
                color: kPrimaryColor.withOpacity(0.3),
                height: 1,
                indent: 12,
                endIndent: 12,
              ),
              state.savedLocations != null
                  ? Expanded(
                      child: ListView.separated(
                        itemCount: state.savedLocations!.length,
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: kPrimaryColor.withOpacity(0.3),
                            height: 1,
                            indent: 12,
                            endIndent: 12,
                          );
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
                            child: ListTile(
                              title: Text(
                                state.savedLocations![index].localizedName!,
                                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w300),
                              ),
                              onTap: () {
                                context
                                    .read<WeatherCubit>()
                                    .fetchWeather(int.parse(state.locations![index].key!));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(city: state.locations![index].localizedName),
                                    ));
                              },
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        );
      },
    );
  }
}
