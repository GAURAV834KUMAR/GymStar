import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reel_comment_widget.dart' show ReelCommentWidget;
import 'package:flutter/material.dart';

class ReelCommentModel extends FlutterFlowModel<ReelCommentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentController;
  String? Function(BuildContext, String?)? commentControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  ReelCommentRecord? comment;

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
