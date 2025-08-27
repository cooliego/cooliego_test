import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'loginpage_widget.dart' show LoginpageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginpageModel extends FlutterFlowModel<LoginpageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for phoneController widget.
  FocusNode? phoneControllerFocusNode;
  TextEditingController? phoneControllerTextController;
  String? Function(BuildContext, String?)?
      phoneControllerTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneControllerFocusNode?.dispose();
    phoneControllerTextController?.dispose();
  }
}
