import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_username_confirmation_widget.dart'
    show SignUpUsernameConfirmationWidget;
import 'package:flutter/material.dart';

class SignUpUsernameConfirmationModel
    extends FlutterFlowModel<SignUpUsernameConfirmationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Email_HIDDEN widget.
  FocusNode? emailHIDDENFocusNode;
  TextEditingController? emailHIDDENController;
  String? Function(BuildContext, String?)? emailHIDDENControllerValidator;
  // State field(s) for Password_HIDDEN widget.
  FocusNode? passwordHIDDENFocusNode;
  TextEditingController? passwordHIDDENController;
  late bool passwordHIDDENVisibility;
  String? Function(BuildContext, String?)? passwordHIDDENControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordHIDDENVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailHIDDENFocusNode?.dispose();
    emailHIDDENController?.dispose();

    passwordHIDDENFocusNode?.dispose();
    passwordHIDDENController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
