import 'package:admin/views/authenticationview/loginview.dart';
import 'package:admin/views/homeview/homeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  static const String id = "mainpage";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    return user == null ? LoginView() : HomeView();
  }
}
