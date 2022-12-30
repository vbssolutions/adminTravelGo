import 'package:admin/models/reservationFiles.dart';
import 'package:admin/views/constant.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentReservationsFiles extends StatelessWidget {
  const RecentReservationsFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            decoration: BoxDecoration(
              color: Color(0xFFf4f7fa),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Réservations en attente",
                  style: GoogleFonts.fredokaOne(fontSize: 16),
                ),
                Row(
                  children: [
                    Text("validation automatique"),
                    Switch(value: false, onChanged: (value) {})
                  ],
                )
              ],
            ),
          ),
          Container(
            height: Kheight(context, 0.45),
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text(
                    "Code ticket",
                    style: GoogleFonts.fredokaOne(color: Color(0xFF346daa)),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Départ",
                    style: GoogleFonts.fredokaOne(color: Color(0xFF346daa)),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Destination",
                    style: GoogleFonts.fredokaOne(color: Color(0xFF346daa)),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Date",
                    style: GoogleFonts.fredokaOne(color: Color(0xFF346daa)),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Statut",
                    style: GoogleFonts.fredokaOne(color: Color(0xFF346daa)),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Actions",
                    style: GoogleFonts.fredokaOne(color: Color(0xFF346daa)),
                  ),
                ),
              ],
              rows: List.generate(
                demoReservations.length,
                (index) => recentReservationDataRow(demoReservations[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentReservationDataRow(Reservation fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Icon(
              Icons.brightness_1,
              size: 10,
              color: Colors.blue,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(
                  fileInfo.codeTicket!,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
      DataCell(Row(
        children: [
          Expanded(
              child: Text(
            fileInfo.depart!,
            overflow: TextOverflow.ellipsis,
          ))
        ],
      )),
      DataCell(Row(
        children: [
          Expanded(
              child: Text(
            fileInfo.destination!,
            overflow: TextOverflow.ellipsis,
          ))
        ],
      )),
      DataCell(Row(
        children: [
          Expanded(
              child: Text(
            fileInfo.date!,
            overflow: TextOverflow.ellipsis,
          ))
        ],
      )),
      DataCell(fileInfo.statut!
          ? Row(children: [
              Expanded(
                child: Text("VALIDE",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.fredokaOne(
                        color: Colors.green, fontWeight: FontWeight.bold)),
              )
            ])
          : Row(
              children: [
                Expanded(
                    child: Text("en attente...",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.fredokaOne(
                            color: Colors.orange, fontWeight: FontWeight.bold)))
              ],
            )),
      DataCell(Container(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: fileInfo.statut! ? Colors.orange : Colors.blue),
            onPressed: () {},
            child: Text(
              fileInfo.statut! ? "annuler" : "valider",
            )),
      )),
    ],
  );
}
