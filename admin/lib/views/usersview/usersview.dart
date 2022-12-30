import 'package:admin/responsive.dart';
import 'package:admin/views/constant.dart';
import 'package:admin/views/usersview/components/users.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersView extends StatelessWidget {
  static const String id = "usersview";
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
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
                "Utilisateurs",
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
                icon: Icon(FontAwesomeIcons.plus),
                label: Text("Nouvel utilisateur"),
              ),
            ],
          ),
          SizedBox(height: Kheight(context, 0.01)),
          Row(
            children: [
              Expanded(
                child: UsersListValues(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
