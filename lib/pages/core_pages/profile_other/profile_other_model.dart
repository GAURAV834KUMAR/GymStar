import '/backend/backend.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'profile_other_widget.dart' show ProfileOtherWidget;
import 'package:flutter/material.dart';

class ProfileOtherModel extends FlutterFlowModel<ProfileOtherWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in NewChatButton widget.
  ChatsRecord? chat;
  // State field(s) for Timer_FollowButtonActions widget.
  int timerFollowButtonActionsMilliseconds = 200;
  String timerFollowButtonActionsValue =
      StopWatchTimer.getDisplayTime(200, milliSecond: false);
  FlutterFlowTimerController timerFollowButtonActionsController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - Create Document] action in Timer_FollowButtonActions widget.
  NotificationsRecord? notification;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    timerFollowButtonActionsController.dispose();
    tabBarController?.dispose();
    navBar1Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
