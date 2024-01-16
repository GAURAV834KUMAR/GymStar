import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/post/post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_details_widget.dart' show PostDetailsWidget;
import 'package:flutter/material.dart';

class PostDetailsModel extends FlutterFlowModel<PostDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for post component.
  late PostModel postModel;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    postModel = createModel(context, () => PostModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    postModel.dispose();
    navBar1Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
