import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comments_widget.dart' show CommentsWidget;
import 'package:flutter/material.dart';

class CommentsModel extends FlutterFlowModel<CommentsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  NotificationsRecord? notification;
  // State field(s) for Comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentController;
  String? Function(BuildContext, String?)? commentControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  CommentsRecord? comment;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  NotificationsRecord? notification1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    commentFocusNode?.dispose();
    commentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
