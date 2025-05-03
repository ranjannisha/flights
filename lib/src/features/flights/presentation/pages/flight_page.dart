import 'package:auto_route/auto_route.dart';
import 'package:flight/src/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flight/l10n/l10n.dart';
import 'package:flight/src/core/di/injection.dart';
import 'package:flight/src/core/extensions/text_style_extensions.dart';
import 'package:flight/src/core/themes/app_styles.dart';
import 'package:flight/src/features/flights/presentation/bloc/flight/flight_cubit.dart';

@RoutePage()
class FlightPage extends StatelessWidget {
  const FlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FlightCubit>()..loadFlights(),
      child: _FlightsListView(),
    );
  }
}

class _FlightsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.flight, style: AppStyles.text12PxRegular.blackColor),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          BlocBuilder<FlightCubit, FlightState>(
            builder: (context, state) {
              String currentFilter = 'All';
              state.maybeWhen(
                success: (_, selectedFilter) {
                  if (selectedFilter != null) {
                    currentFilter = selectedFilter;
                  }
                },
                orElse: () {},
              );

              return DropdownButton<String>(
                value: currentFilter,
                onChanged: (filter) {
                  if (filter != null) {
                    context.read<FlightCubit>().loadFlights(
                        filter: filter == 'All' ? null : filter);
                  }
                },
                items: const ['All', 'Non-stop', '1 Stop']
                    .map((f) => DropdownMenuItem(value: f, child: Text(f)))
                    .toList(),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<FlightCubit, FlightState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initializing...')),
            loading: () => const Center(child: CircularProgressIndicator()),
            noInternet: () => const Center(child: Text('No internet connection')),
            error: (message) => Center(child: Text('Error: $message')),
            success: (itineraries, selectedFilter) {
              if (itineraries.isEmpty) {
                return const Center(child: Text('No flights available'));
              }

              return ListView.builder(
                itemCount: itineraries.length,
                itemBuilder: (context, index) {
                  final itinerary = itineraries[index];
                  final leg = itinerary.legs.first;
                  return InkWell(
                    onTap: (){
                      context.router.push( FlightDetailRoute(itinerary: itinerary));
                    },
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text('Price: \$${itinerary.price}'),
                        subtitle: Text(
                          '${leg.departure} → ${leg.arrival} | Airline: ${leg.airlineId} | Stops: ${leg.stops}',
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
