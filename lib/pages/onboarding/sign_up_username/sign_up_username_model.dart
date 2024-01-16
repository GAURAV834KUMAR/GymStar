import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_username_widget.dart' show SignUpUsernameWidget;
import 'package:flutter/material.dart';

class SignUpUsernameModel extends FlutterFlowModel<SignUpUsernameWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameController;
  String? Function(BuildContext, String?)? usernameControllerValidator;
  String? _usernameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Username is required.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    usernameControllerValidator = _usernameControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    usernameFocusNode?.dispose();
    usernameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
