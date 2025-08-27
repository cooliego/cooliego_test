import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'bookingpagenew3_widget.dart' show Bookingpagenew3Widget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Bookingpagenew3Model extends FlutterFlowModel<Bookingpagenew3Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDownstation widget.
  String? dropDownstationValue;
  FormFieldController<String>? dropDownstationValueController;
  DateTime? datePicked;
  // State field(s) for DropDownweight widget.
  String? dropDownweightValue;
  FormFieldController<String>? dropDownweightValueController;
  // State field(s) for DropDownnumbags widget.
  String? dropDownnumbagsValue;
  FormFieldController<String>? dropDownnumbagsValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
