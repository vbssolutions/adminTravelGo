import 'package:admin/views/constant.dart';
import 'package:admin/views/dashboardview/components/departure_form.dart';
import 'package:admin/views/dashboardview/components/departure_list.dart';
import 'package:admin/views/dashboardview/components/text-input.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardAction {
  final BuildContext? context;
  final String? title;
  final IconData? icon;
  final Color? bgColor;
  final Function()? onPress;

  DashboardAction(
      {this.icon, this.bgColor, this.title, this.onPress, this.context});
}

List dashboardActions = [
  DashboardAction(
      title: "Nouveau départ",
      icon: FontAwesomeIcons.calendarPlus,
      bgColor: Color(0XFF57068c),
      onPress: () {}),
  DashboardAction(
      title: "Départ programmé",
      icon: Icons.event_available,
      bgColor: Color(0XFF0046ad),
      onPress: () {}),
  DashboardAction(
      title: "Nouveau message",
      icon: FontAwesomeIcons.message,
      bgColor: Color(0XFF0046ad),
      onPress: () {
        print("Nouveau message");
      })
];

void showEditDepartureForm(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogBackgroundColor: KbgColor,
    closeIcon: Icon(Icons.close),
    animType: AnimType.SCALE,
    dialogType: DialogType.noHeader,
    body: EditDepartureForm(),
    title: "Enregistremment de nouveau départ",
    btnOkColor: Colors.red,
  )..show();
}

void showDepartureList(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogBackgroundColor: KbgColor,
    closeIcon: Icon(Icons.close),
    animType: AnimType.SCALE,
    dialogType: DialogType.noHeader,
    body: DepartureList(),
    title: "Liste des départ",
    btnOkColor: Colors.red,
  )..show();
}

void showProfilView(BuildContext context) {
  AwesomeDialog(
    width: KWigth(context, 0.7),
    context: context,
    dialogBackgroundColor: KbgColor,
    closeIcon: Icon(Icons.close),
    animType: AnimType.SCALE,
    dialogType: DialogType.noHeader,
    body: ProfilView(),
    title: "Profil",
    btnOkColor: Colors.red,
  )..show();
}

class ProfilView extends StatefulWidget {
  const ProfilView({super.key});

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (MediaQuery.of(context).size.width > 700)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: KWigth(context, 0.01)),
                  width: KWigth(context, 0.15),
                  height: Kheight(context, 0.35),
                  decoration: BoxDecoration(
                      color: KbgColor,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/profil.png")))),
              Expanded(
                  child: Container(
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: GoogleFonts.fredoka(
                          fontSize: 23, color: Color(0xFF041c4a)),
                    ),
                    SizedBox(
                      height: Kheight(context, 0.01),
                    ),
                    Text(
                      "Ce profil est un compte administrateur fictif pour la gestion de la plateforme.Aucune information de ce compte ne peut être modifier sans l'approbation de Vision Business Solutions",
                      style: GoogleFonts.fredoka(
                          fontSize: 18, color: Color(0xFF041c4a)),
                    ),
                    SizedBox(
                      height: Kheight(context, 0.03),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "admin@gmail.com",
                              style: GoogleFonts.fredoka(
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: Kheight(context, 0.02),
                            ),
                            Text(
                              "administrateur",
                              style: GoogleFonts.fredoka(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Mot de passe: ",
                                  style: GoogleFonts.fredoka(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "adminvbs",
                                  style: GoogleFonts.fredoka(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Kheight(context, 0.02),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Siège: ",
                                  style: GoogleFonts.fredoka(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Ouagadougou",
                                  style: GoogleFonts.fredoka(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: KWigth(context, 0.02),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Kheight(context, 0.03),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Demander une modification",
                          style: GoogleFonts.fredoka(color: Colors.white),
                        ))
                  ],
                ),
              ))
            ],
          ),
        if (MediaQuery.of(context).size.width < 700)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: KWigth(context, 0.03),
                    vertical: Kheight(context, 0.02)),
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: GoogleFonts.fredoka(
                          fontSize: 23, color: Color(0xFF041c4a)),
                    ),
                    SizedBox(
                      height: Kheight(context, 0.01),
                    ),
                    Text(
                      "Ce profil est un compte administrateur fictif pour la gestion de la plateforme.Aucune information de ce compte ne peut être modifier sans l'approbation de Vision Business Solutions",
                      style: GoogleFonts.fredoka(
                          fontSize: 18, color: Color(0xFF041c4a)),
                    ),
                    SizedBox(
                      height: Kheight(context, 0.03),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "admin@gmail.com",
                              style: GoogleFonts.fredoka(
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: Kheight(context, 0.02),
                            ),
                            Text(
                              "administrateur",
                              style: GoogleFonts.fredoka(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Mot de passe: ",
                                  style: GoogleFonts.fredoka(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "adminvbs",
                                  style: GoogleFonts.fredoka(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Kheight(context, 0.02),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Siège: ",
                                  style: GoogleFonts.fredoka(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Ouagadougou",
                                  style: GoogleFonts.fredoka(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: KWigth(context, 0.02),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Kheight(context, 0.03),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Demander une modification",
                          style: GoogleFonts.fredoka(color: Colors.white),
                        ))
                  ],
                ),
              ))
            ],
          )
      ],
    ));
  }
}
