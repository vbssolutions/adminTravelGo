import 'package:admin/views/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedBtn extends StatefulWidget {
  const RoundedBtn(
      {Key? key,
      this.height,
      this.width,
      this.bgColor,
      this.title,
      this.titleColor})
      : super(key: key);
  final double? height;
  final Color? bgColor;
  final Color? titleColor;
  final double? width;
  final String? title;

  @override
  State<RoundedBtn> createState() => _RoundedBtnState();
}

class _RoundedBtnState extends State<RoundedBtn> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.bgColor,
        border: Border.all(color: Color(0xFFcbcbcb)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
          child: Text(
        widget.title!,
        style: GoogleFonts.fredoka(color: widget.titleColor),
      )),
    );
  }
}
