import 'package:admin/views/constant.dart';
import 'package:admin/views/dashboardview/components/text-input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditDepartureForm extends StatefulWidget {
  const EditDepartureForm({super.key});

  @override
  State<EditDepartureForm> createState() => _EditDepartureFormState();
}

class _EditDepartureFormState extends State<EditDepartureForm> {
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
                  "Nouveau départ",
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
                height: Kheight(context, 0.6),
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Détails du départ",
                              style: GoogleFonts.fredokaOne(
                                  fontSize: 16, color: Colors.black),
                            ),
                            Text(
                              "",
                              style: GoogleFonts.fredokaOne(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF848484)),
                            )
                          ],
                        ),
                        SizedBox(height: defaultPadding),
                        if (_size.width > 900)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: KWigth(context, 0.01)),
                                child: Column(
                                  children: [
                                    DateTextInput(
                                      width: KWigth(context, 0.27),
                                      height: KWigth(context, 0.045),
                                    ),
                                    PlacesInput(
                                      width: KWigth(context, 0.27),
                                      height: KWigth(context, 0.045),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: KWigth(context, 0.01)),
                                child: Column(
                                  children: [
                                    VehicleInput(
                                      width: KWigth(context, 0.27),
                                      height: KWigth(context, 0.045),
                                    ),
                                    DestinationInput(
                                      width: KWigth(context, 0.27),
                                      height: KWigth(context, 0.045),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        if (_size.width > 900)
                          Center(
                            child: EditDepartureBtn(
                              width: KWigth(context, 0.27),
                              height: KWigth(context, 0.045),
                            ),
                          ),
                        if (_size.width < 900 && _size.width > 650)
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DateTextInput(
                                      width: KWigth(context, 0.3),
                                      height: KWigth(context, 0.06),
                                    ),
                                    SizedBox(
                                      width: KWigth(context, 0.03),
                                    ),
                                    PlacesInput(
                                      width: KWigth(context, 0.3),
                                      height: KWigth(context, 0.06),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    VehicleInput(
                                      width: KWigth(context, 0.3),
                                      height: KWigth(context, 0.06),
                                    ),
                                    SizedBox(
                                      width: KWigth(context, 0.03),
                                    ),
                                    DestinationInput(
                                      width: KWigth(context, 0.3),
                                      height: KWigth(context, 0.06),
                                    ),
                                  ],
                                ),
                                EditDepartureBtn(
                                  width: KWigth(context, 0.3),
                                  height: KWigth(context, 0.06),
                                )
                              ],
                            ),
                          ),
                        if (_size.width < 650)
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DateTextInput(
                                  width: KWigth(context, 0.45),
                                  height: KWigth(context, 0.07),
                                ),
                                PlacesInput(
                                  width: KWigth(context, 0.45),
                                  height: KWigth(context, 0.07),
                                ),
                                VehicleInput(
                                  width: KWigth(context, 0.45),
                                  height: KWigth(context, 0.07),
                                ),
                                DestinationInput(
                                  width: KWigth(context, 0.45),
                                  height: KWigth(context, 0.07),
                                ),
                                EditDepartureBtn(
                                  width: KWigth(context, 0.45),
                                  height: KWigth(context, 0.07),
                                )
                              ],
                            ),
                          )
                      ]),
                ))
          ],
        ));
  }
}
