import 'package:auto_route/auto_route.dart';
import 'package:flight/src/core/extensions/widget_extensions.dart';
import 'package:flight/src/features/flights/data/models/itinerary/itinerary_model.dart';
import 'package:flutter/material.dart';
import 'package:flight/l10n/l10n.dart';
import 'package:flight/src/core/extensions/text_style_extensions.dart';
import 'package:flight/src/core/themes/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class FlightDetailPage extends StatefulWidget {
  final ItineraryModel itinerary;
  const FlightDetailPage({super.key, required this.itinerary});

  @override
  State<FlightDetailPage> createState() => _FlightDetailPageState();
}

class _FlightDetailPageState extends State<FlightDetailPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final leg = widget.itinerary.legs.first;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.flight_details,
          style: AppStyles.text12PxRegular.blackColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle(l10n.overview),
              8.verticalSpace,
              _infoRow(
                FontAwesomeIcons.planeDeparture,
                l10n.from,
                leg.departure,
              ),
              _infoRow(FontAwesomeIcons.planeArrival, l10n.to, leg.arrival),
              Divider(height: 32.h),
              _sectionTitle(l10n.flight_info),
              8.verticalSpace,
              _infoRow(
                FontAwesomeIcons.clock,
                l10n.duration,
                '${leg.duration} mins',
              ),
              _infoRow(
                FontAwesomeIcons.route,
                l10n.stops,
                '${leg.stops} stop(s)',
              ),
              _infoRow(
                FontAwesomeIcons.building,
                l10n.airline,
                leg.airlineName,
              ),
              Divider(height: 32.h),
              _sectionTitle(l10n.price),
              8.verticalSpace,
              Text(
                '\$${widget.itinerary.price}',
                style: AppStyles.text24PxBold.darkGreenColor,
              ),
            ],
          ).padAll(16.w),
        ).padAll(16.w),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(title, style: AppStyles.text16PxBold.blackColor);
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        FaIcon(icon, size: 18, color: Colors.blueAccent),
        12.horizontalSpace,
        Text('$label: ', style: AppStyles.text14PxBold.blackColor),
        Expanded(
          child: Text(value, style: AppStyles.text14PxRegular.blackColor),
        ),
      ],
    ).py(8.h);
  }
}
