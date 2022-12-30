import 'package:admin/models/departure_values.dart';
import 'package:admin/models/users.dart';
import 'package:admin/views/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CloudStorageInfo {
  final String? title, totalStorage;
  final IconData? svgSrc;
  final Color? bgColor;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.bgColor,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}
 