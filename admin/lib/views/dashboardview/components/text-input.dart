import 'package:admin/views/constant.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TextInputWithIcon extends StatefulWidget {
  const TextInputWithIcon({
    Key? key,
    required this.icon,
    required this.hint,
    required this.isReadOnly,
    this.height,
    this.width,
    this.inputType,
    this.inputAction,
  }) : super(key: key);
  final double? height;
  final bool isReadOnly;
  final double? width;
  final IconData icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;

  @override
  State<TextInputWithIcon> createState() => _TextInputWithIconState();
}

class _TextInputWithIconState extends State<TextInputWithIcon> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDateTime(context);
        setState(() {
          showDateTime = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          height: widget.height,
          width: widget.width,
          padding: EdgeInsets.symmetric(horizontal: KWigth(context, 0.01)),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFcbcbcb)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(children: [
            Icon(
              widget.icon,
              size: 25,
              color: Color(0xFF041c4a),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              showDateTime ? getDateTime() : "Date de départ",
              style: GoogleFonts.fredoka(),
            )
          ]),
        ),
      ),
    );
  }

  String getDateTime() {
    // ignore: unnecessary_null_comparison
    if (dateTime == null) {
      return 'Date de départ';
    } else {
      return DateFormat('dd-MM-yyyy HH: ss a').format(dateTime);
    }
  }

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  Future _selectDateTime(BuildContext context) async {
    final date = await _selectDate(context);
    if (date == null) return;

    final time = await _selectTime(context);

    if (time == null) return;
    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }
}

class DateTextInput extends StatefulWidget {
  const DateTextInput({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height;

  final double? width;

  @override
  State<DateTextInput> createState() => _DateTextInputState();
}

class _DateTextInputState extends State<DateTextInput> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDateTime(context);
        setState(() {
          showDateTime = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          height: widget.height,
          width: widget.width,
          padding: EdgeInsets.symmetric(horizontal: KWigth(context, 0.01)),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFcbcbcb)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(children: [
            FaIcon(
              FontAwesomeIcons.calendarPlus,
              size: 25,
              color: Color(0xFF041c4a),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              showDateTime ? getDateTime() : "Date de départ",
              style: GoogleFonts.fredoka(),
            )
          ]),
        ),
      ),
    );
  }

  String getDateTime() {
    // ignore: unnecessary_null_comparison
    if (dateTime == null) {
      return 'Date de départ';
    } else {
      return DateFormat('dd-MM-yyyy HH: ss a').format(dateTime);
    }
  }

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  Future _selectDateTime(BuildContext context) async {
    final date = await _selectDate(context);
    if (date == null) return;

    final time = await _selectTime(context);

    if (time == null) return;
    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }
}

class DestinationInput extends StatefulWidget {
  const DestinationInput({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height;

  final double? width;

  @override
  State<DestinationInput> createState() => _DestinationInputState();
}

class _DestinationInputState extends State<DestinationInput> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          height: widget.height,
          width: widget.width,
          padding: EdgeInsets.symmetric(horizontal: KWigth(context, 0.01)),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFcbcbcb)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(children: [
            Icon(
              Icons.location_on,
              size: 25,
              color: Color(0xFF041c4a),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Destination",
              style: GoogleFonts.fredoka(),
            )
          ]),
        ),
      ),
    );
  }
}

class PlacesInput extends StatefulWidget {
  const PlacesInput({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height;

  final double? width;

  @override
  State<PlacesInput> createState() => _PlacesInputState();
}

class _PlacesInputState extends State<PlacesInput> {
  final List<String> items = [
    'Roxgold',
    'Kaarma',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          height: widget.height,
          width: widget.width,
          padding: EdgeInsets.symmetric(horizontal: KWigth(context, 0.01)),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFcbcbcb)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(children: [
            Icon(
              FontAwesomeIcons.sourcetree,
              size: 25,
              color: Color(0xFF041c4a),
            ),
            SizedBox(
              width: 20,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text(
                  'Lieu de départ',
                  style: GoogleFonts.fredoka(),
                ),
                items: items
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
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                  });
                },
                buttonHeight: 40,
                buttonWidth: (widget.width! - 100),
                itemHeight: 40,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class AvailableInput extends StatefulWidget {
  const AvailableInput({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height;

  final double? width;

  @override
  State<AvailableInput> createState() => _AvailableInputState();
}

class _AvailableInputState extends State<AvailableInput> {
  int avalaiblePlace = 0;
  bool showplace = false;
  void addPlace() {
    setState(() {
      avalaiblePlace = avalaiblePlace + 1;
    });
  }

  void lessPlace() {
    if (avalaiblePlace > 1) {
      setState(() {
        avalaiblePlace = avalaiblePlace - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          height: widget.height,
          width: widget.width,
          padding: EdgeInsets.symmetric(horizontal: KWigth(context, 0.01)),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFcbcbcb)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(children: [
            Icon(
              Icons.accessible,
              size: 25,
              color: Color(0xFF041c4a),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
              showplace ? avalaiblePlace.toString() : "Place disponible",
              style: GoogleFonts.fredoka(),
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (!showplace) {
                      setState(() {
                        showplace = true;
                      });
                    }

                    addPlace();
                  },
                  child: Icon(
                    Icons.arrow_drop_up,
                    size: 20,
                    color: Color(0xFF041c4a),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (!showplace) {
                      setState(() {
                        showplace = true;
                      });
                    }

                    lessPlace();
                  },
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 20,
                    color: Color(0xFF041c4a),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class VehicleInput extends StatefulWidget {
  const VehicleInput({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height;

  final double? width;

  @override
  State<VehicleInput> createState() => _VehicleInputState();
}

class _VehicleInputState extends State<VehicleInput> {
  final List<String> items = [
    'BUS567',
    'BUS789',
    'HC8909',
    'PI7896',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          height: widget.height,
          width: widget.width,
          padding: EdgeInsets.symmetric(horizontal: KWigth(context, 0.01)),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFcbcbcb)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(children: [
            Icon(
              Icons.directions_bus,
              size: 25,
              color: Color(0xFF041c4a),
            ),
            SizedBox(
              width: 20,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text(
                  'Moyen de transport',
                  style: GoogleFonts.fredoka(),
                ),
                items: items
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
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                  });
                },
                buttonHeight: 40,
                buttonWidth: (widget.width! - 100),
                itemHeight: 40,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class EditDepartureBtn extends StatefulWidget {
  const EditDepartureBtn({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height;

  final double? width;

  @override
  State<EditDepartureBtn> createState() => _EditDepartureBtnState();
}

class _EditDepartureBtnState extends State<EditDepartureBtn> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          height: widget.height,
          width: widget.width,
          padding: EdgeInsets.symmetric(horizontal: KWigth(context, 0.01)),
          decoration: BoxDecoration(
            color: Color(0xFF041c4a),
            border: Border.all(color: Color(0xFFcbcbcb)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Enregistrer",
              style: GoogleFonts.fredoka(color: Colors.white),
            ),
            SizedBox(
              width: 40,
            ),
            Icon(
              Icons.arrow_forward,
              size: 20,
              color: Colors.white,
            ),
          ]),
        ),
      ),
    );
  }
}
