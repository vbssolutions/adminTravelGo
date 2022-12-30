class Reservation {
  final String? codeTicket, destination, depart, date;
  final bool? statut;

  Reservation(
      {this.codeTicket, this.destination, this.date, this.depart, this.statut});
}

List demoReservations = [
  Reservation(
      codeTicket: "B7900890909090",
      destination: "Ouahigouya",
      date: "01-03-2021",
      depart: "Roxgold",
      statut: false),
  Reservation(
      codeTicket: "B7900890909090",
      destination: "Banfora",
      date: "01-03-2021",
      depart: "Roxgold",
      statut: false),
  Reservation(
      codeTicket: "B7900890909090",
      destination: "Dori",
      date: "01-03-2021",
      depart: "Kaarma",
      statut: true),
  Reservation(
      codeTicket: "B7900890909090",
      destination: "Ouahigouya",
      date: "01-03-2021",
      depart: "Roxgold",
      statut: true),
  Reservation(
      codeTicket: "B7900890909090",
      destination: "Tenkodogo",
      date: "01-03-2021",
      depart: "Endevour Mining",
      statut: false),
  Reservation(
      codeTicket: "B7900890909090",
      destination: "Banfora",
      date: "01-03-2021",
      depart: "Roxgold",
      statut: false),
  Reservation(
      codeTicket: "B7900890909090",
      destination: "Bobo Dioulasso",
      date: "01-03-2021",
      depart: "Roxgold",
      statut: true),
  Reservation(
      codeTicket: "B7900890909090",
      destination: "Kaya",
      date: "01-03-2021",
      depart: "Kaarma",
      statut: false),
];
