import 'package:admin/services/firebase_services.dart';
import 'package:admin/views/constant.dart';
import 'package:admin/views/homeview/homeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'loginview.dart';

class ForgotPasswordView extends StatefulWidget {
  static const String id = "loginview";

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController _emailController = TextEditingController();

  bool _isLogin = false;
  bool _isOk = false;

  Future _restorePassword(BuildContext context) async {
    if (_emailController.text != "") {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text.trim());

        setState(() {
          _isLogin = false;
          _isOk = true;
        });
        Fluttertoast.showToast(
            msg: "Verifier votre boite mail",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.grey[400]!.withOpacity(
              0.4,
            ),
            textColor: KprimaryColor,
            fontSize: 16.0);
      } on FirebaseAuthException catch (e) {
        if (e.message.toString() ==
            "There is no user record corresponding to this identifier. The user may have been deleted.") {
          setState(() {
            _isLogin = false;
          });
          Fluttertoast.showToast(
              msg: "Cette adresse email n'est pas administrateur.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.red[400]!.withOpacity(
                0.4,
              ),
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (e.message.toString() ==
            "The email address is badly formatted.") {
          setState(() {
            _isLogin = false;
          });
          Fluttertoast.showToast(
              msg: "Entrer une adresse email valide.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.red[400]!.withOpacity(
                0.4,
              ),
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          Fluttertoast.showToast(
              msg: "Erreur de connexion.\nVérifier votre connexion internet.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.red[400]!.withOpacity(
                0.4,
              ),
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    } else {
      setState(() {
        _isLogin = false;
      });
      Fluttertoast.showToast(
          msg: "Veuillez entrer une adresse email.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red[400]!.withOpacity(
            0.4,
          ),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: KbgColor,
        body: Row(
          children: [
            if (_size.width > 1100)
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: KWigth(context, 0.1),
                      vertical: Kheight(context, 0.2)),
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reccupération de mot de passe",
                          style: GoogleFonts.fredoka(
                              fontSize: 30, color: Color(0xFF848484)),
                        ),
                        SizedBox(
                          height: Kheight(context, 0.01),
                        ),
                        Text(
                          _isOk
                              ? "Vérifier votre boite email, nous avons envoyé un email à l'adresse " +
                                  _emailController.text +
                                  "."
                              : "Entrer votre adresse email pour recevoir des instructions de réinitialisation de votre mot de passe",
                          style: GoogleFonts.fredoka(
                              fontSize: 20, color: Color(0xFF848484)),
                        ),
                        SizedBox(
                          height: Kheight(context, 0.05),
                        ),
                        _isOk
                            ? Container()
                            : TextInputField(
                                hint: "Email",
                                inputType: TextInputType.emailAddress,
                                controller: _emailController,
                                isPasswordfield: false),
                        SizedBox(
                          height: Kheight(context, 0.03),
                        ),
                        _isOk
                            ? Container()
                            : Center(
                                child: _isLogin
                                    ? SpinKitChasingDots(
                                        color: KprimaryColor,
                                      )
                                    : Container(
                                        width: KWigth(context, 0.8),
                                        height: Kheight(context, 0.075),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: KprimaryColor),
                                          onPressed: () {
                                            setState(() {
                                              _isLogin = true;
                                            });
                                            _restorePassword(context);
                                          },
                                          child: Text(
                                            "Recevoir le email",
                                            style: GoogleFonts.fredoka(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                              )
                      ]),
                ),
              ),
            if (_size.width > 1100)
              Container(
                width: KWigth(context, 0.5),
                child: Image.asset(
                  "assets/images/back-forgot.png",
                  scale: 0.3,
                ),
              ),
            if (_size.width < 1100)
              Container(
                width: _size.width < 900
                    ? KWigth(context, 0.01)
                    : KWigth(context, 0.21),
              ),
            if (_size.width < 1100)
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: KWigth(context, 0.1),
                      vertical: Kheight(context, 0.2)),
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reccupération de mot de passe",
                          style: GoogleFonts.fredoka(
                              fontSize: 30, color: Color(0xFF848484)),
                        ),
                        SizedBox(
                          height: Kheight(context, 0.01),
                        ),
                        Text(
                          _isOk
                              ? "Vérifier votre boite email, nous avons envoyé un email à l'adresse " +
                                  _emailController.text +
                                  "."
                              : "Entrer votre adresse email pour recevoir des instructions de réinitialisation de votre mot de passe",
                          style: GoogleFonts.fredoka(
                              fontSize: 20, color: Color(0xFF848484)),
                        ),
                        SizedBox(
                          height: Kheight(context, 0.05),
                        ),
                        _isOk
                            ? Container()
                            : TextInputField(
                                hint: "Email",
                                inputType: TextInputType.emailAddress,
                                controller: _emailController,
                                isPasswordfield: false),
                        SizedBox(
                          height: Kheight(context, 0.03),
                        ),
                        _isOk
                            ? Container()
                            : Center(
                                child: _isLogin
                                    ? SpinKitChasingDots(
                                        color: KprimaryColor,
                                      )
                                    : Container(
                                        width: KWigth(context, 0.8),
                                        height: Kheight(context, 0.075),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: KprimaryColor),
                                          onPressed: () {
                                            setState(() {
                                              _isLogin = true;
                                            });
                                            _restorePassword(context);
                                          },
                                          child: Text(
                                            "Recevoir le email",
                                            style: GoogleFonts.fredoka(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                              )
                      ]),
                ),
              ),
            if (_size.width < 1100)
              Container(
                width: _size.width < 900
                    ? KWigth(context, 0.01)
                    : KWigth(context, 0.21),
              ),
          ],
        ));
  }
}
