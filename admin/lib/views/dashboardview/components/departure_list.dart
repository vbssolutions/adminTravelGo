import 'package:admin/models/actions.dart';
import 'package:admin/models/departure_values.dart';
import 'package:admin/responsive.dart';
import 'package:admin/services/firebase_services.dart';
import 'package:admin/views/constant.dart';
import 'package:admin/views/dashboardview/components/rounded_btn.dart';
import 'package:admin/views/dashboardview/components/text-input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DepartureList extends StatefulWidget {
  const DepartureList({super.key});

  @override
  State<DepartureList> createState() => _DepartureListState();
}

class _DepartureListState extends State<DepartureList> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tous les départ programmés",
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
            SizedBox(height: defaultPadding),
            Container(
                height: Kheight(context, 0.75),
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(204, 235, 235, 235),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PlacesBtn(),
                                SizedBox(
                                  width: KWigth(context, 0.01),
                                ),
                                DestinationBtn(),
                                SizedBox(
                                  width: KWigth(context, 0.01),
                                ),
                                DateBtn()
                              ],
                            ),
                            SizedBox(
                              height: Kheight(context, 0.02),
                            ),
                            SearchBtn()
                          ]),
                        ),
                        SizedBox(
                          height: Kheight(context, 0.03),
                        ),
                        Responsive(
                          mobile: DepartureCardGridView(
                            crossAxisCount: _size.width < 650 ? 1 : 2,
                          ),
                          tablet: DepartureCardGridView(
                            crossAxisCount:
                                (_size.width > 650 && _size.width < 1300)
                                    ? 2
                                    : 3,
                          ),
                          desktop: DepartureCardGridView(
                            crossAxisCount: (_size.width > 1300) ? 4 : 3,
                          ),
                        ),
                      ]),
                ))
          ],
        ));
  }
}

class DepartureCardGridView extends StatelessWidget {
  DepartureCardGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  DatabaseService _services = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _services.departures.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong :' + snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        if (snapshot.hasData) {
          return GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: childAspectRatio,
            ),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return DepartureItem(
                comeFrom: data['departurePark'],
                goTo: "Banfora",
                enginCode: data['vehicle'],
                dateTime: "01-02-2022",
                enginType: data['vehicleType'],
              );
            }).toList(),
          );
        }
        ;
        return SizedBox();
      },
    );
  }
}

class PlacesBtn extends StatefulWidget {
  const PlacesBtn({super.key});

  @override
  State<PlacesBtn> createState() => _PlacesBtnState();
}

class _PlacesBtnState extends State<PlacesBtn> {
  final List<String> placesList = [
    'Roxgold',
    'Kaarma',
  ];
  String? selectedValuePlace;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: KWigth(context, 0.03),
      width: KWigth(context, 0.15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFcbcbcb)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        SizedBox(
          width: 10,
        ),
        FaIcon(
          FontAwesomeIcons.sourcetree,
          color: Colors.grey,
        ),
        SizedBox(
          width: KWigth(context, 0.01),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Text(
              'Lieu de départ',
              style: GoogleFonts.fredoka(),
            ),
            items: placesList
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: selectedValuePlace,
            onChanged: (value) {
              setState(() {
                selectedValuePlace = value as String;
              });
            },
            buttonHeight: 40,
            buttonWidth: KWigth(context, 0.1),
            itemHeight: 40,
          ),
        ),
      ]),
    );
  }
}

class SearchBtn extends StatefulWidget {
  const SearchBtn({super.key});

  @override
  State<SearchBtn> createState() => _SearchBtnState();
}

class _SearchBtnState extends State<SearchBtn> {
  String? selectedValuePlace;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: KWigth(context, 0.03),
        width: KWigth(context, 0.15),
        decoration: BoxDecoration(
            color: KprimaryColor,
            border: Border.all(color: Color(0xFFcbcbcb)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          SizedBox(
            width: 10,
          ),
          FaIcon(
            FontAwesomeIcons.search,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: KWigth(context, 0.01),
          ),
          Text(
            "Rechercher départ",
            textAlign: TextAlign.center,
            style: GoogleFonts.fredoka(color: Colors.white),
          )
        ]),
      ),
    );
  }
}

class DestinationBtn extends StatefulWidget {
  const DestinationBtn({super.key});

  @override
  State<DestinationBtn> createState() => _DestinationBtnState();
}

class _DestinationBtnState extends State<DestinationBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: KWigth(context, 0.03),
        width: KWigth(context, 0.15),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFcbcbcb)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          SizedBox(
            width: 10,
          ),
          FaIcon(
            Icons.location_on,
            color: Colors.grey,
          ),
          SizedBox(
            width: KWigth(context, 0.01),
          ),
          Text(
            "Destination",
            style: GoogleFonts.fredoka(),
          )
        ]),
      ),
    );
  }
}

class DateBtn extends StatefulWidget {
  const DateBtn({super.key});

  @override
  State<DateBtn> createState() => _DateBtnState();
}

class _DateBtnState extends State<DateBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: KWigth(context, 0.03),
        width: KWigth(context, 0.15),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFcbcbcb)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          SizedBox(
            width: 10,
          ),
          FaIcon(
            FontAwesomeIcons.calendarAlt,
            color: Colors.grey,
          ),
          SizedBox(
            width: KWigth(context, 0.01),
          ),
          Text(
            "Date de départ",
            style: GoogleFonts.fredoka(),
          )
        ]),
      ),
    );
  }
}

class DepartureItem extends StatefulWidget {
  final String? comeFrom;
  final String? goTo;
  final String? enginCode;
  final String? dateTime;
  final String? enginType;
  const DepartureItem(
      {super.key,
      this.comeFrom,
      this.dateTime,
      this.enginCode,
      this.enginType,
      this.goTo});

  @override
  State<DepartureItem> createState() => _DepartureItemState();
}

class _DepartureItemState extends State<DepartureItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: KWigth(context, 0.01), vertical: Kheight(context, 0.02)),
      decoration: BoxDecoration(
        color: Color.fromARGB(204, 235, 235, 235),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.more_vert, color: Color(0xFF041c4a)),
              SizedBox(
                width: KWigth(context, 0.005),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  widget.comeFrom!,
                  style: GoogleFonts.fredoka(
                      color: Color(0xFF041c4a), fontSize: 15),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  color: Color(0xFF888888),
                  height: 1,
                  width: KWigth(context, 0.01),
                ),
                SizedBox(
                  width: 5,
                ),
                FaIcon(
                  FontAwesomeIcons.truckMoving,
                  size: 25,
                  color: Color(0xFF888888),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  color: Color(0xFF888888),
                  height: 1,
                  width: KWigth(context, 0.01),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.goTo!,
                  style: GoogleFonts.fredoka(
                      color: Color(0xFF041c4a), fontSize: 15),
                )
              ]),
            ],
          ),
          SizedBox(
            height: Kheight(context, 0.03),
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                color: Color(0xFF888888),
                height: 1,
              ))
            ],
          ),
          SizedBox(
            height: Kheight(context, 0.03),
          ),
          Row(
            children: [
              Icon(
                Icons.directions_bus,
                color: Color(0xFF888888),
                size: 25,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Engin No. ",
                style: GoogleFonts.fredoka(fontSize: 15),
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                widget.enginCode!,
                style: GoogleFonts.fredoka(
                    fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: Kheight(context, 0.03),
          ),
          Row(
            children: [
              Icon(
                Icons.watch,
                color: Color(0xFF888888),
                size: 25,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Date de départ:",
                style: GoogleFonts.fredoka(fontSize: 15),
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                widget.dateTime!.toString(),
                style: GoogleFonts.fredoka(
                    fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: Kheight(context, 0.03),
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                color: Color(0xFF888888),
                height: 1,
              ))
            ],
          ),
          SizedBox(
            height: Kheight(context, 0.01),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  showEditDepartureForm(context);
                },
                child: RoundedBtn(
                  width: KWigth(context, 0.06),
                  height: KWigth(context, 0.02),
                  title: "Modifier",
                  bgColor: Color(0xFF041c4a),
                  titleColor: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {},
                child: RoundedBtn(
                  width: KWigth(context, 0.06),
                  height: KWigth(context, 0.02),
                  title: "Suprimmer",
                  bgColor: Colors.white,
                  titleColor: Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
