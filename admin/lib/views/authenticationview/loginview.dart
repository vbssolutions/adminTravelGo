import 'package:admin/services/firebase_services.dart';
import 'package:admin/views/authenticationview/forgotPasswordview.dart';
import 'package:admin/views/constant.dart';
import 'package:admin/views/homeview/homeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class LoginView extends StatefulWidget {
  static const String id = "loginview";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _remenberMe = false;
  bool _isLogin = false;

  Future _login(BuildContext context) async {
    if (_emailController.text != "" && _passwordController.text != "") {
      AuthService _auth = AuthService();
      dynamic result = await _auth.signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);

      if (result == null) {
      } else if (result ==
              "The password is invalid or the user does not have a password." ||
          result ==
              "We have blocked all requests from this device due to unusual activity. Try again later.") {
        Fluttertoast.showToast(
            msg: "Mot de passe incorrect.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red[400]!.withOpacity(
              0.5,
            ),
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          _isLogin = false;
        });
      } else if (result == "The email address is badly formatted.") {
        Fluttertoast.showToast(
            msg: "Adresse email invalide.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red[400]!.withOpacity(
              0.5,
            ),
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          _isLogin = false;
        });
      } else if (result ==
          "There is no user record corresponding to this identifier. The user may have been deleted.") {
        Fluttertoast.showToast(
            msg: "Cette adresse email ne dispose pas d'accès administrateur.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red[400]!.withOpacity(
              0.5,
            ),
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          _isLogin = false;
        });
      } else if (result == "") {
        Fluttertoast.showToast(
            msg: "Erreur de connexion.\nVérifier votre connexion internet.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red[400]!.withOpacity(
              0.5,
            ),
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          _isLogin = false;
        });
      } else {
        setState(() {
          _isLogin = false;
        });
        Fluttertoast.showToast(
            msg: "Connexion réussie",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.grey[400]!.withOpacity(
              0.4,
            ),
            textColor: KprimaryColor,
            fontSize: 16.0);
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeftJoined,
                duration: Duration(milliseconds: 700),
                reverseDuration: Duration(milliseconds: 700),
                childCurrent: LoginView(),
                child: HomeView()));
      }
    } else {
      Fluttertoast.showToast(
          msg:
              "Erreur de connexion\nVeuillez renseigner correctement les tous les champs",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red[400]!.withOpacity(
            0.5,
          ),
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        _isLogin = false;
      });
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
                      vertical: Kheight(context, 0.15)),
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Content de vous revoir",
                          style: GoogleFonts.fredoka(
                              fontSize: 20, color: Color(0xFF848484)),
                        ),
                        SizedBox(
                          height: Kheight(context, 0.01),
                        ),
                        Text(
                          "Connectez-vous pour continuer",
                          style: GoogleFonts.fredoka(
                              fontSize: 30, color: Color(0xFF848484)),
                        ),
                        SizedBox(
                          height: Kheight(context, 0.05),
                        ),
                        TextInputField(
                            hint: "Login with email",
                            inputType: TextInputType.emailAddress,
                            controller: _emailController,
                            isPasswordfield: false),
                        SizedBox(
                          height: Kheight(context, 0.01),
                        ),
                        TextInputField(
                            hint: "Password",
                            controller: _passwordController,
                            isPasswordfield: true),
                        SizedBox(
                          height: Kheight(context, 0.01),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: _remenberMe,
                                    onChanged: (onChanged) {
                                      setState(() {
                                        _remenberMe = !_remenberMe;
                                      });
                                    }),
                                Text(
                                  "Remember me",
                                  style: GoogleFonts.fredoka(
                                      color: Color(0xFF848484), fontSize: 16),
                                )
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType
                                              .rightToLeftJoined,
                                          duration: Duration(milliseconds: 700),
                                          reverseDuration:
                                              Duration(milliseconds: 700),
                                          childCurrent: LoginView(),
                                          child: ForgotPasswordView()));
                                },
                                child: Text(
                                  "Forgot password?",
                                  style: GoogleFonts.fredoka(
                                      color: Color(0xFF848484), fontSize: 18),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: Kheight(context, 0.03),
                        ),
                        Center(
                          child: _isLogin
                              ? SpinKitChasingDots(
                                  color: KprimaryColor,
                                )
                              : Container(
                                  width: KWigth(context, 0.8),
                                  height: Kheight(context, 0.08),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: KprimaryColor),
                                    onPressed: () {
                                      setState(() {
                                        _isLogin = true;
                                      });
                                      _login(context);
                                    },
                                    child: Text(
                                      "Login",
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
                  "assets/images/login-back.png",
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
                      vertical: Kheight(context, 0.15)),
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Content de vous revoir",
                          style: GoogleFonts.fredoka(
                              fontSize: 20, color: Color(0xFF848484)),
                        ),
                        SizedBox(
                          height: Kheight(context, 0.01),
                        ),
                        Text(
                          "Connectez-vous pour continuer",
                          style: GoogleFonts.fredoka(
                              fontSize: 30, color: Color(0xFF848484)),
                        ),
                        SizedBox(
                          height: Kheight(context, 0.05),
                        ),
                        TextInputField(
                            hint: "Login with email",
                            inputType: TextInputType.emailAddress,
                            controller: _emailController,
                            isPasswordfield: false),
                        SizedBox(
                          height: Kheight(context, 0.01),
                        ),
                        TextInputField(
                            hint: "Password",
                            controller: _passwordController,
                            isPasswordfield: true),
                        SizedBox(
                          height: Kheight(context, 0.01),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: _remenberMe,
                                    onChanged: (onChanged) {
                                      setState(() {
                                        _remenberMe = !_remenberMe;
                                      });
                                    }),
                                Text(
                                  "Remember me",
                                  style: GoogleFonts.fredoka(
                                      color: Color(0xFF848484), fontSize: 16),
                                )
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType
                                              .rightToLeftJoined,
                                          duration: Duration(milliseconds: 700),
                                          reverseDuration:
                                              Duration(milliseconds: 700),
                                          childCurrent: LoginView(),
                                          child: ForgotPasswordView()));
                                },
                                child: Text(
                                  "Forgot password?",
                                  style: GoogleFonts.fredoka(
                                      color: Color(0xFF848484), fontSize: 18),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: Kheight(context, 0.03),
                        ),
                        Center(
                          child: _isLogin
                              ? SpinKitChasingDots(
                                  color: KprimaryColor,
                                )
                              : Container(
                                  width: KWigth(context, 0.8),
                                  height: Kheight(context, 0.08),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: KprimaryColor),
                                    onPressed: () {
                                      setState(() {
                                        _isLogin = true;
                                      });
                                      _login(context);
                                    },
                                    child: Text(
                                      "Login",
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

class TextInputField extends StatelessWidget {
  const TextInputField(
      {Key? key,
      required this.hint,
      this.inputType,
      this.inputAction,
      required this.controller,
      required this.isPasswordfield})
      : super(key: key);

  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool isPasswordfield;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xFFf6f7fb),
          border: Border.all(color: Color(0xFFcbcbcb)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: TextField(
            obscureText: isPasswordfield,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: GoogleFonts.fredoka(color: Colors.grey),
            ),
            style: GoogleFonts.fredoka(),
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}
