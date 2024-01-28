import '/backend/backend.dart';
import '/components/follower_componant/follower_componant_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'followers_following_other_model.dart';
export 'followers_following_other_model.dart';

class FollowersFollowingOtherWidget extends StatefulWidget {
  const FollowersFollowingOtherWidget({
    super.key,
    this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<FollowersFollowingOtherWidget> createState() =>
      _FollowersFollowingOtherWidgetState();
}

class _FollowersFollowingOtherWidgetState
    extends State<FollowersFollowingOtherWidget> with TickerProviderStateMixin {
  late FollowersFollowingOtherModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FollowersFollowingOtherModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

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
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pop();
            },
            child: Icon(
              FFIcons.karrowLeft,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ),
          title: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(widget.userRef!),
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
              final textUsersRecord = snapshot.data!;
              return Text(
                valueOrDefault<String>(
                  textUsersRecord.username,
                  'user',
                ),
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 16.0,
                    ),
              );
            },
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(widget.userRef!),
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
              final containerUsersRecord = snapshot.data!;
              return Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: StreamBuilder<List<FollowersRecord>>(
                  stream: queryFollowersRecord(
                    parent: widget.userRef,
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
                    List<FollowersRecord> tabBarFollowersRecordList =
                        snapshot.data!;
                    final tabBarFollowersRecord =
                        tabBarFollowersRecordList.isNotEmpty
                            ? tabBarFollowersRecordList.first
                            : null;
                    return Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 15.0,
                                ),
                            unselectedLabelStyle: const TextStyle(),
                            indicatorColor:
                                FlutterFlowTheme.of(context).secondary,
                            indicatorWeight: 2.0,
                            tabs: [
                              Tab(
                                text: valueOrDefault<String>(
                                  '${formatNumber(
                                    tabBarFollowersRecord?.userRefs.length,
                                    formatType: FormatType.compact,
                                  )} Followers',
                                  '0 Followers',
                                ),
                              ),
                              Tab(
                                text: valueOrDefault<String>(
                                  '${valueOrDefault<String>(
                                    formatNumber(
                                      containerUsersRecord.following.length,
                                      formatType: FormatType.compact,
                                    ),
                                    '0',
                                  )} Following',
                                  '0 Followers',
                                ),
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              KeepAliveWidgetWrapper(
                                builder: (context) => Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final followers = tabBarFollowersRecord
                                              ?.userRefs
                                              .toList() ??
                                          [];
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: followers.length,
                                        itemBuilder: (context, followersIndex) {
                                          final followersItem =
                                              followers[followersIndex];
                                          return FollowerComponantWidget(
                                            key: Key(
                                                'Keyt0b_${followersIndex}_of_${followers.length}'),
                                            users: followersItem,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              KeepAliveWidgetWrapper(
                                builder: (context) => Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final following = containerUsersRecord
                                          .following
                                          .toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: following.length,
                                        itemBuilder: (context, followingIndex) {
                                          final followingItem =
                                              following[followingIndex];
                                          return FollowerComponantWidget(
                                            key: Key(
                                                'Key2ku_${followingIndex}_of_${following.length}'),
                                            users: followingItem,
                                          );
                                        },
                                      );
                                    },
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
            },
          ),
        ),
      ),
    );
  }
}
