import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flight/gen/assets.gen.dart';
import 'package:flight/l10n/l10n.dart';
import 'package:flight/src/core/constants/app_constants.dart';
import 'package:flight/src/core/di/injection.dart';
import 'package:flight/src/core/helpers/theme_helper.dart';
import 'package:flight/src/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flight/src/features/flights/presentation/bloc/airline/airline_cubit.dart';
import 'package:talker_flutter/talker_flutter.dart';

final talker = TalkerFlutter.init();
final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(Assets.icons.background.path), context);
    precacheImage(AssetImage(Assets.icons.investment.path), context);
    var loader = SvgAssetLoader(Assets.icons.fingerprint.path);
    svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));

    return BlocProvider(
      create: (_) => getIt<AirlineCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(320, 710),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            title: AppConstants.flight,
            scaffoldMessengerKey: scaffoldKey,
            routerDelegate: _router.delegate(),
            debugShowCheckedModeBanner: false,
            routeInformationParser: _router.defaultRouteParser(),
            theme: getApplicationTheme(context),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            builder: (context, child) =>
                TalkerWrapper(
                  talker: talker,
                  child: Overlay(
                    initialEntries: [
                      OverlayEntry(
                        builder: (context) => child!,
                        maintainState: true,
                        opaque: true,
                      ),
                    ],
                  ),
                ),
          );
        },
      ),
    );
  }
}
