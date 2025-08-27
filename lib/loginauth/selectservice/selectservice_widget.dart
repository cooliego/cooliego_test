import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selectservice_model.dart';
export 'selectservice_model.dart';

/// Page Name: SelectServicePage
/// Theme: Simple, aesthetic Indian railway vibes — soft reds, browns, or
/// earthy tones; railway font-style headings if possible; icons or
/// illustrations related to luggage and patients.
///
/// Page Content:
///
/// A centered title:
/// Text: "How can we help you today?"
/// Style: Large, bold, railway-inspired font (optional), centered.
///
/// Two primary buttons, stacked vertically with rounded corners and subtle
/// shadows:
///
/// Button 1: "Coolie Transportation"
///
/// On Tap → Navigate to a sub-page or bottom sheet/modal that asks:
///
/// "Choose Direction"
///
/// Button A: "Platform to Station"
///
/// Button B: "Station to Platform"
///
/// Button 2: "Patient Transportation"
///
/// On Tap → Navigate similarly to a sub-page or modal with same two direction
/// options.
///
/// Background: Light beige or pastel color with faint train tracks or luggage
/// icon watermark for vibe.
///
/// Optional Icon/Header: Add a small icon at the top — like a coolie with
/// luggage or hospital cross.
///
/// Add smooth transition animations (fade-in or slide-up) for a clean UX
class SelectserviceWidget extends StatefulWidget {
  const SelectserviceWidget({super.key});

  static String routeName = 'selectservice';
  static String routePath = '/selectservice';

  @override
  State<SelectserviceWidget> createState() => _SelectserviceWidgetState();
}

class _SelectserviceWidgetState extends State<SelectserviceWidget> {
  late SelectserviceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectserviceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'r6s77zch' /* How can we help you today? */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            font: GoogleFonts.sora(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .fontStyle,
                            ),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .displaySmall
                                .fontStyle,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Future.wait([
                          Future(() async {
                            context.pushNamed(TransitWidget.routeName);
                          }),
                          Future(() async {
                            FFAppState().serviceType = 'coolieservice';
                            safeSetState(() {});
                          }),
                        ]);
                      },
                      text: FFLocalizations.of(context).getText(
                        'gatbtfps' /* Coolie Service */,
                      ),
                      icon: Icon(
                        Icons.luggage,
                        size: 24.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 60.0,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconColor: Colors.white,
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  font: GoogleFonts.sora(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await launchURL(
                            'https://wa.me/917898988824?text=I%20need%20help%20with%20patient%20booking%20at%20this%20station-');
                      },
                      text: FFLocalizations.of(context).getText(
                        '2lk3rxe7' /* Patient Transportation */,
                      ),
                      icon: Icon(
                        Icons.medical_services,
                        size: 24.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 60.0,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                        iconColor: Colors.white,
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  font: GoogleFonts.sora(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
