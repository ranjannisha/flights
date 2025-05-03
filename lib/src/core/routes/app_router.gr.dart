// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AirlineRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AirlinePage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    FlightDetailRoute.name: (routeData) {
      final args = routeData.argsAs<FlightDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FlightDetailPage(
          key: args.key,
          itinerary: args.itinerary,
        ),
      );
    },
    FlightRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FlightPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(
          key: args.key,
          canPop: args.canPop,
        ),
      );
    },
    LoginRouteWrapper.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPageWrapper(),
      );
    },
    SignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupPage(),
      );
    },
  };
}

/// generated route for
/// [AirlinePage]
class AirlineRoute extends PageRouteInfo<void> {
  const AirlineRoute({List<PageRouteInfo>? children})
      : super(
          AirlineRoute.name,
          initialChildren: children,
        );

  static const String name = 'AirlineRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FlightDetailPage]
class FlightDetailRoute extends PageRouteInfo<FlightDetailRouteArgs> {
  FlightDetailRoute({
    Key? key,
    required ItineraryModel itinerary,
    List<PageRouteInfo>? children,
  }) : super(
          FlightDetailRoute.name,
          args: FlightDetailRouteArgs(
            key: key,
            itinerary: itinerary,
          ),
          initialChildren: children,
        );

  static const String name = 'FlightDetailRoute';

  static const PageInfo<FlightDetailRouteArgs> page =
      PageInfo<FlightDetailRouteArgs>(name);
}

class FlightDetailRouteArgs {
  const FlightDetailRouteArgs({
    this.key,
    required this.itinerary,
  });

  final Key? key;

  final ItineraryModel itinerary;

  @override
  String toString() {
    return 'FlightDetailRouteArgs{key: $key, itinerary: $itinerary}';
  }
}

/// generated route for
/// [FlightPage]
class FlightRoute extends PageRouteInfo<void> {
  const FlightRoute({List<PageRouteInfo>? children})
      : super(
          FlightRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    bool canPop = true,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            canPop: canPop,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.canPop = true,
  });

  final Key? key;

  final bool canPop;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, canPop: $canPop}';
  }
}

/// generated route for
/// [LoginPageWrapper]
class LoginRouteWrapper extends PageRouteInfo<void> {
  const LoginRouteWrapper({List<PageRouteInfo>? children})
      : super(
          LoginRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'LoginRouteWrapper';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignupPage]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
