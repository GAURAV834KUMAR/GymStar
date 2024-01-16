import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'individual_message_widget.dart' show IndividualMessageWidget;
import 'package:flutter/material.dart';

class IndividualMessageModel extends FlutterFlowModel<IndividualMessageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageController;
  String? Function(BuildContext, String?)? messageControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Send widget.
  ChatMessagesRecord? message;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    messageFocusNode?.dispose();
    messageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
