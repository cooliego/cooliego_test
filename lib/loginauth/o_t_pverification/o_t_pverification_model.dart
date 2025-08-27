import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'dart:math' as math;
import 'o_t_pverification_widget.dart' show OTPverificationWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OTPverificationModel extends FlutterFlowModel<OTPverificationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for otpController widget.
  TextEditingController? otpController;
  FocusNode? otpControllerFocusNode;
  String? Function(BuildContext, String?)? otpControllerValidator;

  @override
  void initState(BuildContext context) {
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    otpControllerFocusNode?.dispose();
    otpController?.dispose();
  }
}
