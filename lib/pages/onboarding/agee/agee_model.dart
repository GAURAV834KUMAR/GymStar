import '/flutter_flow/flutter_flow_util.dart';
import 'agee_widget.dart' show AgeeWidget;
import 'package:flutter/material.dart';

class AgeeModel extends FlutterFlowModel<AgeeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Slider widget.
  double? sliderValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
