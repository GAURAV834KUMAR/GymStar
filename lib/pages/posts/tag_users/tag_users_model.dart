import '/flutter_flow/flutter_flow_util.dart';
import 'tag_users_widget.dart' show TagUsersWidget;
import 'package:flutter/material.dart';

class TagUsersModel extends FlutterFlowModel<TagUsersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

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
