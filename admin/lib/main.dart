import 'package:admin/services/firebase_services.dart';
import 'package:admin/views/authenticationview/loginview.dart';
 
import 'package:admin/views/dashboardview/dashboardview.dart';
import 'package:admin/views/homeview/homeview.dart';
import 'package:admin/views/locationsview/locationview.dart';
import 'package:admin/views/passerelle.dart';
import 'package:admin/views/transportview/transportview.dart';
import 'package:admin/views/usersview/usersview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb)
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAxIHSAVpOaERgI6m3a_qKcVdTMw0CkTFo",
        appId: "1:920805804856:web:6c4c7cda60fddbdbc28fcd",
        storageBucket: "travelgo-372920.appspot.com",
        messagingSenderId: "920805804856",
        projectId: "travelgo-372920",
      ),
    );
  else
    await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      StreamProvider.value(initialData: null, value: AuthService().user)
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelGo',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      initialRoute: MainPage.id,
      routes: {
        MainPage.id: (context) => MainPage(),
        LoginView.id: (context) => LoginView(),
        HomeView.id: (context) => HomeView(),
        UsersView.id: (context) => UsersView(),
        LocationsView.id: (context) => LocationsView(),
        TransportView.id: (context) => TransportView(),
        DashboardView.id: (context) => DashboardView(),
      },
    );
  }
}
