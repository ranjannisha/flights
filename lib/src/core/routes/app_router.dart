import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flight/src/features/authentication/presentation/pages/login/login.dart';
import 'package:flight/src/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flight/src/features/flights/presentation/pages/flight_page.dart';
import 'package:flight/src/features/flights/data/models/itinerary/itinerary_model.dart';
import 'package:flight/src/features/flights/presentation/pages/flight_detail_page.dart';
import 'package:flight/src/features/flights/presentation/pages/airline_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
     AutoRoute(path: '/', page: LoginRoute.page),
    AutoRoute(path: '/', page: SignupRoute.page),
    AutoRoute(
      page: DashboardRoute.page,
      children: [
        AutoRoute(page: AirlineRoute.page),
        AutoRoute(page: FlightRoute.page),
      ],
    ),
    AutoRoute(path: '/', page: FlightDetailRoute.page),
  ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next(true);
  }
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    resolver.next();
  }
}
