import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flight/l10n/l10n.dart';
import 'package:flight/src/core/extensions/text_style_extensions.dart';
import 'package:flight/src/core/themes/app_styles.dart';
import 'package:flight/src/features/flights/presentation/bloc/airline/airline_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AirlinePage extends StatefulWidget {
  const AirlinePage({super.key});

  @override
  State<AirlinePage> createState() => _AirlinePageState();
}

class _AirlinePageState extends State<AirlinePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<AirlineCubit>();
    cubit.loadAirlines();
  }

  void _onSearchChanged(String value) {
    final cubit = context.read<AirlineCubit>();
    final state = cubit.state;
    state.maybeMap(
      success: (state) {
        cubit.loadAirlines(filter: value);
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.airlines, style: AppStyles.text12PxRegular.blackColor),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                labelText: l10n.searchByAirlineName,
                border: const OutlineInputBorder(),
              ),
            ),
            16.verticalSpace,
            Expanded(
              child: BlocBuilder<AirlineCubit, AirlineState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const Center(child: Text('Loading...')),
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    error:
                        (message) => Center(
                          child: Text(message ?? 'Something went wrong'),
                        ),
                    success: (airlines, allLegs, selectedAirlineFilter) {
                      if (airlines.isEmpty) {
                        return const Center(child: Text('No airlines found.'));
                      }
                      return ListView.builder(
                        itemCount: airlines.length,
                        itemBuilder: (context, index) {
                          final airline = airlines[index];
                          return Card(
                            child: ListTile(
                              title: Text(airline.name),
                              subtitle: Text('Flights: ${airline.flightCount}'),
                            ),
                          );
                        },
                      );
                    },
                    noInternet:
                        () => const Center(child: Text('No internet...')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
