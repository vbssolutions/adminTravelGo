import 'package:admin/models/analyseFiles.dart';
import 'package:admin/responsive.dart';
import 'package:admin/services/firebase_services.dart';
import 'package:admin/views/constant.dart';
import 'package:admin/views/dashboardview/components/data_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

class AnalyseFiles extends StatelessWidget {
  const AnalyseFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.notification_add),
              label: Text("Poster une notification"),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 2.2 : 1.1,
          ),
          tablet: FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.9 : 1.4,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.3,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  DatabaseService _services = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder3<QuerySnapshot, QuerySnapshot, QuerySnapshot>(
      streams: StreamTuple3(_services.users.snapshots(),
          _services.departures.snapshots(), _services.users.snapshots()),
      initialData: InitialDataTuple3(null, null, null),
      builder: (context, snapshot) {
        if (snapshot.snapshot1.hasError) {
          return Text(
              'Something went wrong :' + snapshot.snapshot1.error.toString());
        }

        if (snapshot.snapshot1.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        if (snapshot.snapshot1.hasData &&
            snapshot.snapshot2.hasData &&
            snapshot.snapshot3.hasData) {
          return GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: childAspectRatio,
            ),
            children: [
              FileInfoCard(
                title: "Voyages programmés",
                bgColor: Colors.white,
                number: snapshot.snapshot2.data!.size.toInt(),
                color: Color(0XFF2f4e7d),
                icon: FontAwesomeIcons.calendarAlt,
                percentage: 35,
              ),
              FileInfoCard(
                title: "Voyages effectués",
                number: 0,
                color: Colors.orange,
                bgColor: Colors.white,
                icon: FontAwesomeIcons.signal,
                percentage: 35,
              ),
              FileInfoCard(
                title: "Voyages du mois",
                number: 0,
                color: KprimaryColor,
                bgColor: Colors.white,
                icon: FontAwesomeIcons.busAlt,
                percentage: 35,
              ),
              FileInfoCard(
                title: "Utilisateurs",
                number: snapshot.snapshot1.data!.size.toInt(),
                color: Colors.white,
                bgColor: Color(0XFF2f4e7d),
                icon: FontAwesomeIcons.userAlt,
                percentage: 35,
              )
            ],
          );
        }
        ;
        return SizedBox();
      },
    );
  }
}
