import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nothing_weather_clone/data/constants/colors.dart';
import 'package:nothing_weather_clone/logic/locations/locations_cubit.dart';
import 'package:nothing_weather_clone/logic/weather/weather_cubit.dart';
import 'package:nothing_weather_clone/presentation/locations_screen/locations_search_screen.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<LocationsCubit, LocationsState>(
        builder: (context, state) {
          if (state.status == LocationsStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            );
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: const Text(
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
                          return Slidable(
                            key: Key(state.savedLocations![index].key!),
                            dragStartBehavior: DragStartBehavior.start,
                            endActionPane: ActionPane(
                              dismissible: DismissiblePane(
                                key: Key(state.savedLocations![index].key!),
                                onDismissed: () {
                                  context.read<LocationsCubit>().removeLocation(index);
                                },
                              ),
                              closeThreshold: 0.5,
                              extentRatio: 0.20,
                              motion: const StretchMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    context.read<LocationsCubit>().removeLocation(index);
                                  },
                                  backgroundColor: kErrorColor,
                                  foregroundColor: kSecondaryColor,
                                  icon: Icons.delete_outline,
                                ),
                              ],
                            ),
                            child: Padding(
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
                                  log(state.locations![index].localizedName!);
                                  Navigator.pop(context, state.locations![index].localizedName);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox()
            ],
          );
        },
      ),
    );
  }
}
