import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flight/gen/assets.gen.dart';
import 'package:flight/l10n/l10n.dart';
import 'package:flight/src/core/routes/app_router.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final l10n = context.l10n;
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [FlightRoute(),AirlineRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.blueGrey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              label: 'Flights',
              icon: Assets.icons.dashboard.svg(),
              activeIcon: Assets.icons.dashboard.svg(),
            ),
            BottomNavigationBarItem(
              label: 'Airlines',
              icon: Assets.icons.dashboard.svg(),
              activeIcon: Assets.icons.dashboard.svg(),
            ),
          ],
        );
      },
    );
  }
}
