import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/post/post_widget.dart';
import '/components/story/story_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'feed_model.dart';
export 'feed_model.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  late FeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? 'assets/images/20518bed106ac2145e11f37883d15adb__1_-removebg-preview.png'
                  : 'assets/images/Screenshot_2023-04-22_173832-removebg-preview.png',
              width: 146.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 23.0, 0.0),
                    child: Icon(
                      FFIcons.kadd,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 28.0,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 23.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'Search',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 300),
                            ),
                          },
                        );
                      },
                      child: Icon(
                        Icons.search_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 28.0,
                      ),
                    ),
                  ),
                  Stack(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 23.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Notifications');
                          },
                          child: Icon(
                            FFIcons.kheart,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 28.0,
                          ),
                        ),
                      ),
                      if ((currentUserDocument?.unreadNotifications.toList() ??
                                  []).isNotEmpty)
                        AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF83639),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('Messages');
                    },
                    child: Icon(
                      FFIcons.kmessenger,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 26.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.goNamed(
                        'Feed',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<List<StoriesRecord>>(
                                        stream: queryStoriesRecord(
                                          queryBuilder: (storiesRecord) =>
                                              storiesRecord
                                                  .where(
                                                    'expire_time',
                                                    isGreaterThanOrEqualTo:
                                                        getCurrentTimestamp,
                                                  )
                                                  .where(
                                                    'user',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  )
                                                  .orderBy('expire_time',
                                                      descending: true),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return const Center(
                                              child: SizedBox(
                                                width: 12.0,
                                                height: 12.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Colors.white,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<StoriesRecord>
                                              stackStoriesRecordList =
                                              snapshot.data!;
                                          final stackStoriesRecord =
                                              stackStoriesRecordList.isNotEmpty
                                                  ? stackStoriesRecordList.first
                                                  : null;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                allowPhoto: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                setState(() => _model
                                                    .isDataUploading = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                var downloadUrls = <String>[];
                                                try {
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();

                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedMedia.map(
                                                      (m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  _model.isDataUploading =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  setState(() {
                                                    _model.uploadedLocalFile =
                                                        selectedUploadedFiles
                                                            .first;
                                                    _model.uploadedFileUrl =
                                                        downloadUrls.first;
                                                  });
                                                } else {
                                                  setState(() {});
                                                  return;
                                                }
                                              }
                                            },
                                            child: Stack(
                                              children: [
                                                if (!(stackStoriesRecord !=
                                                    null))
                                                  Stack(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.2, 1.2),
                                                    children: [
                                                      AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Container(
                                                          width: 60.0,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  currentUserPhoto,
                                                                  'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                ),
                                                              ).image,
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            width: 3.0,
                                                          ),
                                                        ),
                                                        child: const Icon(
                                                          Icons.add_rounded,
                                                          color: Colors.white,
                                                          size: 16.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (stackStoriesRecord != null)
                                                  Container(
                                                    width: 65.0,
                                                    height: 65.0,
                                                    decoration: const BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xFF7C1E51),
                                                          Color(0xFFDE0046),
                                                          Color(0xFFF7A34B)
                                                        ],
                                                        stops: [0.0, 0.5, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                -1.0, 1.0),
                                                      ),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: const Color(
                                                                  0x00000000),
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        StoryWidget(
                                                                      story:
                                                                          stackStoriesRecord,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        5000));
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            width: 60.0,
                                                            height: 60.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    currentUserPhoto,
                                                                    'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                  ),
                                                                ).image,
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 13.0, 0.0, 0.0),
                                        child: Text(
                                          'Your story',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: StreamBuilder<List<StoriesRecord>>(
                                    stream: queryStoriesRecord(
                                      queryBuilder: (storiesRecord) =>
                                          storiesRecord
                                              .where(
                                                'expire_time',
                                                isGreaterThanOrEqualTo:
                                                    getCurrentTimestamp,
                                              )
                                              .orderBy('expire_time'),
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
                                      List<StoriesRecord>
                                          userStoriesStoriesRecordList =
                                          snapshot.data!;
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            userStoriesStoriesRecordList.length,
                                            (userStoriesIndex) {
                                          final userStoriesStoriesRecord =
                                              userStoriesStoriesRecordList[
                                                  userStoriesIndex];
                                          return Visibility(
                                            visible:
                                                userStoriesStoriesRecord.user !=
                                                    currentUserReference,
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 15.0, 0.0),
                                              child: FutureBuilder<UsersRecord>(
                                                future:
                                                    UsersRecord.getDocumentOnce(
                                                        userStoriesStoriesRecord
                                                            .user!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return const Center(
                                                      child: SizedBox(
                                                        width: 12.0,
                                                        height: 12.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final columnUsersRecord =
                                                      snapshot.data!;
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        barrierColor:
                                                            const Color(0x00000000),
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  StoryWidget(
                                                                story:
                                                                    userStoriesStoriesRecord,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      if (!userStoriesStoriesRecord
                                                          .views
                                                          .contains(
                                                              currentUserReference)) {
                                                        await userStoriesStoriesRecord
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'views': FieldValue
                                                                  .arrayUnion([
                                                                currentUserReference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      }
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  5000));
                                                      Navigator.pop(context);
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 65.0,
                                                          height: 65.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                Color(
                                                                    0xFF7C1E51),
                                                                Color(
                                                                    0xFFDE0046),
                                                                Color(
                                                                    0xFFF7A34B)
                                                              ],
                                                              stops: [
                                                                0.0,
                                                                0.5,
                                                                1.0
                                                              ],
                                                              begin:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              end:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      1.0),
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Container(
                                                            width: 65.0,
                                                            height: 65.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: userStoriesStoriesRecord
                                                                      .views
                                                                      .contains(
                                                                          currentUserReference)
                                                                  ? const Color(
                                                                      0xFFDADADA)
                                                                  : const Color(
                                                                      0x00999999),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: 60.0,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        columnUsersRecord
                                                                            .photoUrl,
                                                                        'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                      ),
                                                                    ).image,
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              columnUsersRecord
                                                                  .username,
                                                              'user',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Container(
                              width: double.infinity,
                              height: 0.5,
                              decoration: const BoxDecoration(
                                color: Color(0xFFDADADA),
                              ),
                            ),
                          ),
                          PagedListView<DocumentSnapshot<Object?>?,
                              PostsRecord>(
                            pagingController: _model.setPostFeedController(
                              PostsRecord.collection
                                  .where(
                                    'deleted',
                                    isEqualTo: false,
                                  )
                                  .orderBy('time_posted', descending: true),
                            ),
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            reverse: false,
                            scrollDirection: Axis.vertical,
                            builderDelegate:
                                PagedChildBuilderDelegate<PostsRecord>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) => const Center(
                                child: SizedBox(
                                  width: 12.0,
                                  height: 12.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              // Customize what your widget looks like when it's loading another page.
                              newPageProgressIndicatorBuilder: (_) => const Center(
                                child: SizedBox(
                                  width: 12.0,
                                  height: 12.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                              itemBuilder: (context, _, postFeedIndex) {
                                final postFeedPostsRecord = _model
                                    .postFeedPagingController!
                                    .itemList![postFeedIndex];
                                return PostWidget(
                                  key: Key(
                                      'Keyb7n_${postFeedIndex}_of_${_model.postFeedPagingController!.itemList!.length}'),
                                  post: postFeedPostsRecord,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (!(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      child: Container(
                        width: double.infinity,
                        height: 90.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 10.0,
                                          color: Color(0x1A57636C),
                                          offset: Offset(0.0, -10.0),
                                          spreadRadius: 0.1,
                                        )
                                      ],
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Feed');
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? 'assets/images/Home_(1).png'
                                          : 'assets/images/Home.png',
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Statics');
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Insight.png',
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 25.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondary,
                                        icon: Icon(
                                          Icons.movie_filter,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 35.0,
                                        ),
                                        onPressed: () async {
                                          context.goNamed(
                                            'Home',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .topToBottom,
                                                duration:
                                                    Duration(milliseconds: 300),
                                              ),
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Notifications');
                                  },
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Notification.png',
                                          width: 24.0,
                                          height: 24.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Ellipse_28.png',
                                          width: 10.0,
                                          height: 10.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 44.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/Ellipse_29.png',
                                      ).image,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('Profile');
                                        },
                                        child: Container(
                                          width: 36.0,
                                          height: 36.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/59.png',
                                              ).image,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
