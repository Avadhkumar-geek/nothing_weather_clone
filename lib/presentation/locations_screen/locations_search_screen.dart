import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing_weather_clone/data/constants/colors.dart';
import 'package:nothing_weather_clone/logic/locations/locations_cubit.dart';

class LocationsSearchScreen extends StatelessWidget {
  const LocationsSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "ADD LOCATIONS",
          style: TextStyle(fontSize: 15),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close_outlined),
          onPressed: () => Navigator.pop(
            context,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w300, color: kPrimaryColor),
              ),
              onSubmitted: (value) {
                context.read<LocationsCubit>().locationsList(value.trim());
              },
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilder<LocationsCubit, LocationsState>(
            builder: (context, state) {
              if (state.status == LocationsStatus.initial) {
                const SizedBox();
              }
              if (state.status == LocationsStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              }
              if (state.status == LocationsStatus.success &&
                  state.locations == null) {
                return const Center(
                  child: Text(
                    "NO RESULTS",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                );
              }
              if (state.status == LocationsStatus.success) {
                final locations = state.locations!;
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    physics: const PageScrollPhysics(),
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(locations[index].localizedName!),
                        subtitle: Text(
                          '${locations[index].administrativeArea!.localizedName!}, ${locations[index].country!.localizedName!}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                          ),
                        ),
                        onTap: () {
                          context
                              .read<LocationsCubit>()
                              .addLocation(locations[index]);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
