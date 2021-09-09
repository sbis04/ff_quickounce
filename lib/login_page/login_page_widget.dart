import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 100,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                  Text(
                    'Quickounce',
                    style: FlutterFlowTheme.title1.override(
                      fontFamily: 'Condiment',
                      color: Colors.white,
                      fontSize: 58,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 12, 15, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x22EEEEEE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                        child: TextFormField(
                          controller: emailTextController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Phone number, username or email',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 10,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 10,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lato',
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x22EEEEEE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: TextFormField(
                          controller: passwordTextController,
                          obscureText: !passwordVisibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 10,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 10,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => passwordVisibility = !passwordVisibility,
                              ),
                              child: Icon(
                                passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 22,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lato',
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(1, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 15, 0),
                      child: InkWell(
                        onTap: () async {
                          if (emailTextController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Email required!',
                                ),
                              ),
                            );
                            return;
                          }
                          await resetPassword(
                            email: emailTextController.text,
                            context: context,
                          );
                        },
                        child: Text(
                          'Forgot password?',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final user = await signInWithEmail(
                          context,
                          emailTextController.text,
                          passwordTextController.text,
                        );
                        if (user == null) {
                          return;
                        }

                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'FeedPage'),
                          ),
                          (r) => false,
                        );
                      },
                      text: 'Log In',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40,
                        color: Color(0xFF1062AE),
                        textStyle: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Poppins',
                          color: Color(0x7EFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: 6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color(0x19EEEEEE),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                          child: Text(
                            'OR',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Color(0xA5FFFFFF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color(0x19EEEEEE),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                          child: Image.asset(
                            'assets/images/fb_logo.png',
                            width: 25,
                            height: 25,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(6, 3, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'FeedPage'),
                                ),
                              );
                            },
                            child: Text(
                              'Log In With Facebook',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lato',
                                color: FlutterFlowTheme.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment(-0.03, 0.85),
              child: Container(
                width: double.infinity,
                height: 0.5,
                decoration: BoxDecoration(
                  color: Color(0x45EEEEEE),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 1),
              child: Container(
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Align(
                  alignment: Alignment(0, 0.93),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment(0, 0.96),
                        child: Text(
                          'Don\'t have an account?',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lato',
                            color: Color(0x7EFFFFFF),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0.96),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                          child: Text(
                            'Sign Up.',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: FlutterFlowTheme.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
