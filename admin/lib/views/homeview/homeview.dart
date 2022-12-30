import 'package:admin/models/actions.dart';
import 'package:admin/services/firebase_services.dart';
import 'package:admin/views/constant.dart';
import 'package:admin/views/dashboardview/dashboardview.dart';
import 'package:admin/views/locationsview/locationview.dart';
import 'package:admin/views/transportview/transportview.dart';
import 'package:admin/views/usersview/usersview.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static const String id = "homeview";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Widget _selectedView = DashboardView();

  currentView(item) {
    switch (item.route) {
      case DashboardView.id:
        setState(() {
          _selectedView = DashboardView();
        });
        break;

      case UsersView.id:
        setState(() {
          _selectedView = UsersView();
        });
        break;

      case TransportView.id:
        setState(() {
          _selectedView = TransportView();
        });
        break;
      case LocationsView.id:
        setState(() {
          _selectedView = LocationsView();
        });
        break;
    }
  }

  List<String> profilActions = ["Voir profil", "Se Déconnecter"];
  String? selectedValue;
  bool _isDeconnecting = false;

  String? mounthSelected;

  final List<String> mounths = [
    'Janvier',
    'Février',
    'Mars',
    'Avril',
    'Mai',
    'Juin',
    'Juillet',
    'Août',
    'Septembre',
    'Octobre',
    'Novembre',
    'Décembre',
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    return _isDeconnecting
        ? SpinKitChasingDots(
            color: KprimaryColor,
          )
        : AdminScaffold(
            backgroundColor: KbgColor,
            appBar: AppBar(
              backgroundColor: KprimaryColor,
              title: Text(
                'TravelGo',
                style: GoogleFonts.fredokaOne(fontSize: 30),
              ),
              actions: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    iconEnabledColor: Colors.white,
                    itemSplashColor: KprimaryColor,
                    buttonSplashColor: KprimaryColor,
                    hint: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          child: CircleAvatar(
                              backgroundColor: Color(0xFF041c4a),
                              child: Icon(Icons.person)),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "John Doe",
                          style: GoogleFonts.fredoka(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    items: profilActions
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
                    value: selectedValue,
                    onChanged: (value) async {
                      setState(() {
                        selectedValue = value as String;
                      });

                      if (selectedValue == "Se Déconnecter") {
                        _isDeconnecting = true;
                        await AuthService().signOut();
                      }

                      if (selectedValue == "Voir profil") {
                        showProfilView(context);
                      }
                    },
                    buttonHeight: 40,
                    buttonWidth: 170,
                    itemHeight: 40,
                  ),
                ),
                SizedBox(
                  width: KWigth(context, 0.05),
                )
              ],
            ),
            sideBar: SideBar(
              textStyle: GoogleFonts.fredoka(color: Color(0xFF848484)),
              backgroundColor: Colors.white,
              iconColor: Color(0xFF2f577d),
              items: const [
                AdminMenuItem(
                    title: 'Dashboard',
                    icon: Icons.dashboard,
                    route: DashboardView.id),
                AdminMenuItem(
                  title: 'Utilisateurs',
                  icon: Icons.people,
                  route: UsersView.id,
                ),
                AdminMenuItem(
                  title: 'Transport',
                  icon: Icons.directions_bus,
                  route: TransportView.id,
                ),
                AdminMenuItem(
                  title: 'Lieux',
                  icon: Icons.location_on,
                  route: LocationsView.id,
                ),
              ],
              selectedRoute: HomeView.id,
              onSelected: (item) {
                currentView(item);
              },
              header: Container(
                width: double.infinity,
                padding: EdgeInsets.all(5),
                color: Colors.white,
                child: Container(
                    color: KbgColor,
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total de départ",
                              style: GoogleFonts.fredoka(
                                  color: Color(0xFF041c4a), fontSize: 15),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white),
                                onPressed: () {},
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    hint: Text(
                                      "Janvier",
                                      style: GoogleFonts.fredoka(
                                        color: Color(0xFF041c4a),
                                      ),
                                    ),
                                    items: mounths
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
                                    value: mounthSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        mounthSelected = value;
                                      });
                                    },
                                    buttonHeight: 40,
                                    buttonWidth: 100,
                                    itemHeight: 40,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "35",
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF041c4a),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ))),
              ),
              footer: Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "Vision Business Soultions",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.fredoka(color: Color(0xFF041c4a)),
                    ),
                  )),
            ),
            body: _selectedView,
          );
  }
}
