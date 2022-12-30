import 'package:admin/models/actions.dart';
import 'package:admin/models/analyseFiles.dart';
import 'package:admin/views/constant.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.bgColor,
    required this.color,
    required this.number,
    required this.percentage,
  }) : super(key: key);

  final String? title;
  final IconData? icon;
  final Color? bgColor;
  final Color? color;
  final int? percentage;
  final int? number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color:
                    title == "Utilisateurs" ? Colors.white : Color(0xFF848484)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " ${number}",
                style: GoogleFonts.fredokaOne(
                    fontWeight: FontWeight.bold,
                    color: title == "Utilisateurs"
                        ? Colors.white
                        : Color(0xFF041c4a)),
              ),
              Icon(
                icon,
                size: 40,
                color:
                    title == "Utilisateurs" ? Colors.white : Color(0xFF848484),
              )
            ],
          ),
          ProgressLine(
            color: color,
            percentage: percentage,
          ),
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  ProgressLine({
    Key? key,
    this.color = Colors.green,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 7,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 7,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
