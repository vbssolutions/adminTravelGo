import 'package:admin/models/actions.dart';
import 'package:admin/models/reservationFiles.dart';
import 'package:admin/views/constant.dart';
import 'package:admin/views/dashboardview/components/analyseFiles.dart';
import 'package:admin/views/dashboardview/components/data_info.dart';
import 'package:admin/views/dashboardview/components/recentReservation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../responsive.dart';

class DashboardView extends StatelessWidget {
  static const String id = "dashboardview";
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    print(_size.width);
    return SingleChildScrollView(
      primary: false,
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dashboard",
                style: GoogleFonts.fredokaOne(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Text(
                "Operator admin",
                style: GoogleFonts.fredokaOne(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF848484)),
              )
            ],
          ),
          SizedBox(height: Kheight(context, 0.01)),
          AnalyseFiles(),
          SizedBox(height: Kheight(context, 0.01)),
          Row(
            children: [
              Expanded(
                child: RecentReservationsFiles(),
              ),
              if (_size.width > 1300)
                Container(
                  margin: EdgeInsets.only(left: KWigth(context, 0.008)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        dashboardActions.length,
                        ((index) => DashboardActionCard(
                              isColumn: true,
                              width: KWigth(context, 0.19),
                              height: KWigth(context, 0.075),
                              action: dashboardActions[index],
                            ))),
                  ),
                ),
            ],
          ),
          if (_size.width < 1300 && _size.width > 650)
            SizedBox(height: Kheight(context, 0.01)),
          if (_size.width < 1300 && _size.width > 650)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  dashboardActions.length,
                  ((index) => DashboardActionCard(
                        isColumn: false,
                        width: KWigth(context, 0.2),
                        height: KWigth(context, 0.1),
                        action: dashboardActions[index],
                      ))),
            ),
          if (_size.width < 1300 && _size.width > 650)
            SizedBox(height: Kheight(context, 0.08)),
          if (_size.width < 650) SizedBox(height: Kheight(context, 0.01)),
          if (_size.width < 650)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  dashboardActions.length,
                  ((index) => DashboardActionCard(
                        isColumn: false,
                        width: KWigth(context, 0.3),
                        height: KWigth(context, 0.15),
                        action: dashboardActions[index],
                      ))),
            ),
          if (_size.width < 650) SizedBox(height: Kheight(context, 0.08)),
        ],
      ),
    );
  }
}

class DashboardActionCard extends StatefulWidget {
  final bool? isColumn;
  final double? width;
  final double? height;
  final DashboardAction? action;
  const DashboardActionCard(
      {this.action, this.height, this.width, this.isColumn});

  @override
  State<DashboardActionCard> createState() => _DashboardActionCardState();
}

class _DashboardActionCardState extends State<DashboardActionCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.action!.title == "Nouveau départ"
          ? () {
              showEditDepartureForm(context);
            }
          : (widget.action!.title == "Départ programmé"
              ? () {
                  showDepartureList(context);
                }
              : () {}),
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: EdgeInsets.symmetric(
            vertical: widget.isColumn! ? Kheight(context, 0.01) : 0),
        decoration: BoxDecoration(
            color: widget.action!.bgColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              widget.action!.icon,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.action!.title.toString(),
              style: GoogleFonts.fredokaOne(color: Colors.white),
            )
          ],
        )),
      ),
    );
  }
}
