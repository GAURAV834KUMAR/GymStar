import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_name_widget.dart' show SignUpNameWidget;
import 'package:flutter/material.dart';

class SignUpNameModel extends FlutterFlowModel<SignUpNameWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for FullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameController;
  String? Function(BuildContext, String?)? fullNameControllerValidator;
  String? _fullNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Full name is required.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    fullNameControllerValidator = _fullNameControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameFocusNode?.dispose();
    fullNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
