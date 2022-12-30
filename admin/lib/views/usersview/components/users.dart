import 'package:admin/models/reservationFiles.dart';
import 'package:admin/models/users.dart';
import 'package:admin/views/constant.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersListValues extends StatelessWidget {
  const UsersListValues({
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
                  "Utilisateurs enrgistrés",
                  style: GoogleFonts.fredokaOne(fontSize: 16),
                ),
                Row(
                  children: [
                    Text(
                      "Total: ",
                      style: GoogleFonts.fredoka(fontSize: 20),
                    ),
                    Text(
                      demoUsers.length.toString(),
                      style: GoogleFonts.fredoka(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
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
                    "No.Matricule",
                    style: GoogleFonts.fredokaOne(color: Color(0xFF346daa)),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Nom & Prénom",
                    style: GoogleFonts.fredokaOne(color: Color(0xFF346daa)),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Adresse email",
                    style: GoogleFonts.fredokaOne(color: Color(0xFF346daa)),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Téléphone",
                    style: GoogleFonts.fredokaOne(color: Color(0xFF346daa)),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Fonction",
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
                demoUsers.length,
                (index) => usersDataRow(demoUsers[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow usersDataRow(UserModel userInfo) {
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
                  userInfo.matricule!,
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
            userInfo.name_surname!,
            overflow: TextOverflow.ellipsis,
          ))
        ],
      )),
      DataCell(Row(
        children: [
          Expanded(
              child: Text(
            userInfo.email!,
            overflow: TextOverflow.ellipsis,
          ))
        ],
      )),
      DataCell(Row(
        children: [
          Expanded(
              child: Text(
            userInfo.phone!,
            overflow: TextOverflow.ellipsis,
          ))
        ],
      )),
      DataCell(Row(
        children: [
          Expanded(
              child: Text(
            userInfo.function!,
            overflow: TextOverflow.ellipsis,
          ))
        ],
      )),
      DataCell(userInfo.statut!
          ? Row(children: [
              Expanded(
                child: Text("actif",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.fredokaOne(
                        color: Colors.green, fontWeight: FontWeight.bold)),
              )
            ])
          : Row(
              children: [
                Expanded(
                    child: Text("non actif",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.fredokaOne(
                            color: Colors.orange, fontWeight: FontWeight.bold)))
              ],
            )),
      DataCell(Container(
        child: Row(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text(
                  "modifier",
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
      )),
    ],
  );
}
