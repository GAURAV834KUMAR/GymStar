import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/personal_post_options/personal_post_options_widget.dart';
import '/components/post_options/post_options_widget.dart';
import '/components/send_post/send_post_widget.dart';
import '/components/tagged_users/tagged_users_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'post_model.dart';
export 'post_model.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
    this.post,
  });

  final PostsRecord? post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> with TickerProviderStateMixin {
  late PostModel _model;

  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.2, 0.2),
          end: const Offset(1.0, 1.0),
        ),
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 1000.ms,
          duration: 150.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.2, 0.2),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.2, 0.2),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
      child: FutureBuilder<UsersRecord>(
        future: UsersRecord.getDocumentOnce(widget.post!.postUser!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                width: 12.0,
                height: 12.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              ),
            );
          }
          final columnUsersRecord = snapshot.data!;
          return Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (columnUsersRecord.reference ==
                            currentUserReference) {
                          context.pushNamed('Profile');
                        } else {
                          context.pushNamed(
                            'ProfileOther',
                            queryParameters: {
                              'username': serializeParam(
                                columnUsersRecord.username,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (columnUsersRecord.reference ==
                                  currentUserReference) {
                                context.pushNamed('Profile');
                              } else {
                                context.pushNamed(
                                  'ProfileOther',
                                  queryParameters: {
                                    'username': serializeParam(
                                      columnUsersRecord.username,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              }
                            },
                            child: Container(
                              width: 35.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                    valueOrDefault<String>(
                                      columnUsersRecord.photoUrl,
                                      'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                    ),
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFFDADADA),
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (columnUsersRecord.reference ==
                                        currentUserReference) {
                                      context.pushNamed('Profile');
                                    } else {
                                      context.pushNamed(
                                        'ProfileOther',
                                        queryParameters: {
                                          'username': serializeParam(
                                            columnUsersRecord.username,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  child: Text(
                                    valueOrDefault<String>(
                                      columnUsersRecord.username,
                                      'user',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                if (widget.post?.location != null &&
                                    widget.post?.location != '')
                                  Text(
                                    widget.post!.location,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (widget.post?.postUser == currentUserReference) {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: const Color(0x00000000),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: PersonalPostOptionsWidget(
                                  post: widget.post,
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        } else {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: const Color(0x00000000),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: PostOptionsWidget(
                                  post: widget.post,
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }
                      },
                      child: Icon(
                        FFIcons.kmore,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                decoration: const BoxDecoration(
                  color: Color(0xFFDADADA),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 350.0,
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onDoubleTap: () async {
                          if (widget.post!.allowLikes) {
                            if (widget.post!.likes
                                .contains(currentUserReference)) {
                              await widget.post!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'likes': FieldValue.arrayRemove(
                                        [columnUsersRecord.reference]),
                                  },
                                ),
                              });
                            } else {
                              if (animationsMap[
                                      'iconOnActionTriggerAnimation'] !=
                                  null) {
                                animationsMap['iconOnActionTriggerAnimation']!
                                    .controller
                                    .forward(from: 0.0);
                              }

                              await widget.post!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'likes': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                              HapticFeedback.lightImpact();
                              if (widget.post?.postUser !=
                                  currentUserReference) {
                                var notificationsRecordReference =
                                    NotificationsRecord.createDoc(
                                        columnUsersRecord.reference);
                                await notificationsRecordReference
                                    .set(createNotificationsRecordData(
                                  notificationType: 'Post_Like',
                                  userRef: currentUserReference,
                                  postRef: widget.post?.reference,
                                  timeCreated: getCurrentTimestamp,
                                ));
                                _model.notification =
                                    NotificationsRecord.getDocumentFromData(
                                        createNotificationsRecordData(
                                          notificationType: 'Post_Like',
                                          userRef: currentUserReference,
                                          postRef: widget.post?.reference,
                                          timeCreated: getCurrentTimestamp,
                                        ),
                                        notificationsRecordReference);

                                await columnUsersRecord.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'unreadNotifications':
                                          FieldValue.arrayUnion(
                                              [_model.notification?.reference]),
                                    },
                                  ),
                                });
                              }
                            }
                          }

                          setState(() {});
                        },
                        child: Image.network(
                          valueOrDefault<String>(
                            widget.post?.postPhoto,
                            'https://img.freepik.com/free-photo/young-shirtless-bodybuilder-with-muscular-body-doing-exercise-with-dumbbells-dark-background_613910-20606.jpg?w=360',
                          ),
                          width: double.infinity,
                          height: 350.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: const Icon(
                        Icons.favorite_rounded,
                        color: Color(0xFFFF4963),
                        size: 120.0,
                      ).animateOnActionTrigger(
                        animationsMap['iconOnActionTriggerAnimation']!,
                      ),
                    ),
                    if (widget.post?.callToActionEnabled ?? true)
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL(widget.post!.callToActionLink);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        widget.post?.callToActionText,
                                        'Learn More',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    const Icon(
                                      FFIcons.karrowRight,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (widget.post!.taggedUsers.isNotEmpty)
                      Align(
                        alignment: const AlignmentDirectional(1.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 12.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: const Color(0x00000000),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: TaggedUsersWidget(
                                      post: widget.post,
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: const BoxDecoration(
                                color: Color(0x80000000),
                                shape: BoxShape.circle,
                              ),
                              child: const Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.person_rounded,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 12.0, 15.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (widget.post?.allowLikes ?? true)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: Stack(
                              children: [
                                if (!widget.post!.likes
                                    .contains(currentUserReference))
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (animationsMap[
                                              'iconOnActionTriggerAnimation'] !=
                                          null) {
                                        animationsMap[
                                                'iconOnActionTriggerAnimation']!
                                            .controller
                                            .forward(from: 0.0);
                                      }

                                      await widget.post!.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'likes': FieldValue.arrayUnion(
                                                [currentUserReference]),
                                          },
                                        ),
                                      });
                                      HapticFeedback.lightImpact();
                                      if (widget.post?.postUser !=
                                          currentUserReference) {
                                        var notificationsRecordReference =
                                            NotificationsRecord.createDoc(
                                                columnUsersRecord.reference);
                                        await notificationsRecordReference
                                            .set(createNotificationsRecordData(
                                          notificationType: 'Post_Like',
                                          userRef: currentUserReference,
                                          postRef: widget.post?.reference,
                                          timeCreated: getCurrentTimestamp,
                                        ));
                                        _model.notification1 = NotificationsRecord
                                            .getDocumentFromData(
                                                createNotificationsRecordData(
                                                  notificationType: 'Post_Like',
                                                  userRef: currentUserReference,
                                                  postRef:
                                                      widget.post?.reference,
                                                  timeCreated:
                                                      getCurrentTimestamp,
                                                ),
                                                notificationsRecordReference);

                                        await columnUsersRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'unreadNotifications':
                                                  FieldValue.arrayUnion([
                                                _model.notification1?.reference
                                              ]),
                                            },
                                          ),
                                        });
                                      }

                                      setState(() {});
                                    },
                                    child: Icon(
                                      FFIcons.kheart,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 28.0,
                                    ),
                                  ),
                                if (widget.post?.likes
                                        .contains(currentUserReference) ??
                                    true)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.post!.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'likes': FieldValue.arrayRemove(
                                                [columnUsersRecord.reference]),
                                          },
                                        ),
                                      });

                                      await columnUsersRecord.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'unreadNotifications':
                                                FieldValue.arrayUnion([
                                              _model.notification?.reference
                                            ]),
                                          },
                                        ),
                                      });
                                    },
                                    child: const Icon(
                                      FFIcons.kheart1,
                                      color: Color(0xFFFF4963),
                                      size: 28.0,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'iconOnPageLoadAnimation1']!),
                              ],
                            ),
                          ),
                        if (widget.post?.allowComments ?? true)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'Comments',
                                  queryParameters: {
                                    'post': serializeParam(
                                      widget.post?.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Icon(
                                FFIcons.kcomment,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 26.0,
                              ),
                            ),
                          ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: const Color(0x00000000),
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SendPostWidget(
                                    post: widget.post?.reference,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Icon(
                            FFIcons.kshare,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 26.0,
                          ),
                        ),
                      ],
                    ),
                    StreamBuilder<List<BookmarksRecord>>(
                      stream: queryBookmarksRecord(
                        parent: currentUserReference,
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const Center(
                            child: SizedBox(
                              width: 12.0,
                              height: 12.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                          );
                        }
                        List<BookmarksRecord> stackBookmarksRecordList =
                            snapshot.data!;
                        final stackBookmarksRecord =
                            stackBookmarksRecordList.isNotEmpty
                                ? stackBookmarksRecordList.first
                                : null;
                        return Stack(
                          children: [
                            if (!stackBookmarksRecord!.postRefs
                                .contains(widget.post?.reference))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await stackBookmarksRecord.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'postRefs': FieldValue.arrayUnion(
                                            [widget.post?.reference]),
                                      },
                                    ),
                                  });
                                  HapticFeedback.selectionClick();
                                },
                                child: Icon(
                                  FFIcons.kbookmark,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            if (stackBookmarksRecord.postRefs
                                    .contains(widget.post?.reference) ??
                                true)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await stackBookmarksRecord.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'postRefs': FieldValue.arrayRemove(
                                            [widget.post?.reference]),
                                      },
                                    ),
                                  });
                                },
                                child: Icon(
                                  FFIcons.kbookmark1,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation2']!),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.post?.allowLikes ?? true)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (widget.post!.likes.length > 1)
                              Expanded(
                                child: FutureBuilder<UsersRecord>(
                                  future: UsersRecord.getDocumentOnce(
                                      functions.returnUserFromLikes(
                                          widget.post!.likes.toList())),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 12.0,
                                          height: 12.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final likedByUsersRecord = snapshot.data!;
                                    return custom_widgets.LikedBy(
                                      width: double.infinity,
                                      height: 17.0,
                                      name: valueOrDefault<String>(
                                        likedByUsersRecord.username,
                                        'user',
                                      ),
                                      number: valueOrDefault<String>(
                                        formatNumber(
                                          functions
                                              .totalLikes(valueOrDefault<int>(
                                            widget.post?.likes.length,
                                            1,
                                          )),
                                          formatType: FormatType.compact,
                                        ),
                                        '0',
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (widget.post!.likes.length < 2)
                              Text(
                                '${valueOrDefault<String>(
                                  formatNumber(
                                    widget.post?.likes.length,
                                    formatType: FormatType.compact,
                                  ),
                                  '0',
                                )}${widget.post?.likes.length == 1 ? ' like' : ' likes'}',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                          ],
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (widget.post!.allowComments) {
                                  context.pushNamed(
                                    'Comments',
                                    queryParameters: {
                                      'post': serializeParam(
                                        widget.post?.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              },
                              child: custom_widgets.PhotoCaption(
                                width: double.infinity,
                                height: 17.0,
                                name: valueOrDefault<String>(
                                  columnUsersRecord.username,
                                  'user',
                                ),
                                caption: widget.post!.postCaption,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if ((widget.post?.numComments != 0) &&
                        widget.post!.allowComments)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget.post!.numComments > 1)
                            StreamBuilder<List<CommentsRecord>>(
                              stream: queryCommentsRecord(
                                parent: widget.post?.reference,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: SizedBox(
                                      width: 12.0,
                                      height: 12.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CommentsRecord> textCommentsRecordList =
                                    snapshot.data!;
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Comments',
                                      queryParameters: {
                                        'post': serializeParam(
                                          widget.post?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Text(
                                    'View all ${formatNumber(
                                      textCommentsRecordList.length,
                                      formatType: FormatType.compact,
                                    )} comments',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                );
                              },
                            ),
                          if (widget.post?.numComments == 1)
                            StreamBuilder<List<CommentsRecord>>(
                              stream: queryCommentsRecord(
                                parent: widget.post?.reference,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: SizedBox(
                                      width: 12.0,
                                      height: 12.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CommentsRecord> textCommentsRecordList =
                                    snapshot.data!;
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Comments',
                                      queryParameters: {
                                        'post': serializeParam(
                                          widget.post?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Text(
                                    'View 1 comment',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                    if (widget.post?.allowComments ?? true)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: StreamBuilder<List<CommentsRecord>>(
                          stream: queryCommentsRecord(
                            parent: widget.post?.reference,
                            queryBuilder: (commentsRecord) => commentsRecord
                                .orderBy('time_posted', descending: true),
                            limit: 2,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return const Center(
                                child: SizedBox(
                                  width: 12.0,
                                  height: 12.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<CommentsRecord> columnCommentsRecordList =
                                snapshot.data!;
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'Comments',
                                  queryParameters: {
                                    'post': serializeParam(
                                      widget.post?.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    columnCommentsRecordList.length,
                                    (columnIndex) {
                                  final columnCommentsRecord =
                                      columnCommentsRecordList[columnIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 6.0),
                                    child: FutureBuilder<UsersRecord>(
                                      future: UsersRecord.getDocumentOnce(
                                          columnCommentsRecord.postUser!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return const Center(
                                            child: SizedBox(
                                              width: 12.0,
                                              height: 12.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Colors.white,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final photoCaptionUsersRecord =
                                            snapshot.data!;
                                        return custom_widgets.PhotoCaption(
                                          width: double.infinity,
                                          height: 17.0,
                                          name: valueOrDefault<String>(
                                            photoCaptionUsersRecord.username,
                                            'user',
                                          ),
                                          caption: columnCommentsRecord.comment,
                                        );
                                      },
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                    if (widget.post?.allowComments ?? true)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget.post!.allowComments) {
                              context.pushNamed(
                                'Comments',
                                queryParameters: {
                                  'post': serializeParam(
                                    widget.post?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: 25.0,
                                      height: 25.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                            valueOrDefault<String>(
                                              currentUserPhoto,
                                              'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                            ),
                                          ).image,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Add a comment...',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: Text(
                                      '🎉',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: Text(
                                      '🤩',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Text(
                                    '🥰',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          dateTimeFormat(
                            'relative',
                            widget.post?.timePosted,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          'now',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
