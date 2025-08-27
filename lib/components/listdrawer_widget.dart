import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'listdrawer_model.dart';
export 'listdrawer_model.dart';

/// Create a clean and professional vertical list of button tiles for the
/// CoolieGo app settings and features menu.
///
/// Design Guidelines:
/// Use a white background with soft shadows and rounded corners for each
/// tile/button.
///
/// Each button should have a left-aligned icon and text label.
///
/// Add a subtle right arrow icon on each tile to indicate navigation.
///
/// Use red (#D32F2F) as the accent color for icons or selected items.
///
/// Maintain enough padding and spacing for a clean look.
///
/// Buttons to include (with suitable icons):
/// My Rides – Icon: DirectionsCarRounded
///
/// Payment – Icon: PaymentRounded
///
/// Notifications – Icon: NotificationsActiveRounded
///
/// Safety – Icon: ShieldRounded
///
/// Help – Icon: HelpCenterRounded
///
/// Settings – Icon: SettingsRounded
///
/// Optional Features:
/// Add a title at the top that says: "Menu" or "Explore Features" in bold red
/// text.
///
/// Add subtle separators or dividers between sections if needed.
class ListdrawerWidget extends StatefulWidget {
  const ListdrawerWidget({super.key});

  @override
  State<ListdrawerWidget> createState() => _ListdrawerWidgetState();
}

class _ListdrawerWidgetState extends State<ListdrawerWidget> {
  late ListdrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListdrawerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
