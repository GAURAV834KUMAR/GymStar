import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/post/post_widget.dart';
import '/components/story/story_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class FeedModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PostFeed widget.

  PagingController<DocumentSnapshot?, PostsRecord>? postFeedPagingController;
  Query? postFeedPagingQuery;
  List<StreamSubscription?> postFeedStreamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    postFeedStreamSubscriptions.forEach((s) => s?.cancel());
    postFeedPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, PostsRecord> setPostFeedController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    postFeedPagingController ??= _createPostFeedController(query, parent);
    if (postFeedPagingQuery != query) {
      postFeedPagingQuery = query;
      postFeedPagingController?.refresh();
    }
    return postFeedPagingController!;
  }

  PagingController<DocumentSnapshot?, PostsRecord> _createPostFeedController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, PostsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryPostsRecordPage(
          queryBuilder: (_) => postFeedPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: postFeedStreamSubscriptions,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }
}
