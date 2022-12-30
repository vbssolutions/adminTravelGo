class UserModel {
  final String? matricule, name_surname, email, phone, function;
  final bool? statut;

  UserModel(
      {this.matricule,
      this.name_surname,
      this.email,
      this.phone,
      this.statut,
      this.function});
}

List demoUsers = [
  UserModel(
      matricule: "B800909",
      name_surname: "Kaboré moussa",
      email: "moussakaboré@gmail.com",
      phone: "+226 75235650",
      function: "EMPLOYE",
      statut: false),
  UserModel(
      matricule: "T9898989",
      name_surname: "Kienon Alexi",
      email: "alexikienon@yahoo.com",
      phone: "+226 71234312",
      function: "EMPLOYE",
      statut: false),
  UserModel(
      matricule: "F776767",
      name_surname: "Badolo Laurencia",
      email: "laurenciabadolo@roxgold.com",
      phone: "+226 76887790",
      function: "EMPLOYE",
      statut: true),
  UserModel(
      matricule: "U899898",
      name_surname: "Bako jules",
      email: "julesbako@gmail.com",
      phone: "+226 72369732",
      function: "CHAUFFEUR",
      statut: true),
];
