import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_message_widget.dart' show NewMessageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class NewMessageModel extends FlutterFlowModel<NewMessageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SearchInnput widget.
  FocusNode? searchInnputFocusNode;
  TextEditingController? searchInnputController;
  String? Function(BuildContext, String?)? searchInnputControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // State field(s) for Timer widget.
  int timerMilliseconds = 100;
  String timerValue = StopWatchTimer.getDisplayTime(
    100,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - Create Document] action in ProfileDetails widget.
  ChatsRecord? chat;
  // Stores action output result for [Backend Call - Create Document] action in ProfileDetails widget.
  ChatsRecord? chat1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchInnputFocusNode?.dispose();
    searchInnputController?.dispose();

    timerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
