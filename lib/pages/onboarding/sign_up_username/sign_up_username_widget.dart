import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sign_up_username_model.dart';
export 'sign_up_username_model.dart';

class SignUpUsernameWidget extends StatefulWidget {
  const SignUpUsernameWidget({
    super.key,
    required this.gender,
    required this.age,
    required this.weight,
  });

  final String? gender;
  final double? age;
  final double? weight;

  @override
  State<SignUpUsernameWidget> createState() => _SignUpUsernameWidgetState();
}

class _SignUpUsernameWidgetState extends State<SignUpUsernameWidget> {
  late SignUpUsernameModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpUsernameModel());

    _model.usernameController ??= TextEditingController();
    _model.usernameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

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
        backgroundColor: FlutterFlowTheme.of(context).intro,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 58.0, 0.0, 0.0),
                        child: Text(
                          'Create Username',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Inter',
                                lineHeight: 1.5,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            40.0, 18.0, 40.0, 0.0),
                        child: Text(
                          'Pick a username for your new account. You can always change it later.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.normal,
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: StreamBuilder<List<AdministrativeRecord>>(
                          stream: queryAdministrativeRecord(
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
                            List<AdministrativeRecord>
                                columnAdministrativeRecordList = snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final columnAdministrativeRecord =
                                columnAdministrativeRecordList.isNotEmpty
                                    ? columnAdministrativeRecordList.first
                                    : null;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      40.0, 24.0, 40.0, 12.0),
                                  child: Stack(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    children: [
                                      TextFormField(
                                        controller: _model.usernameController,
                                        focusNode: _model.usernameFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.usernameController',
                                          const Duration(milliseconds: 1000),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Username',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 32.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        keyboardType: TextInputType.name,
                                        validator: _model
                                            .usernameControllerValidator
                                            .asValidator(context),
                                      ),
                                      if (_model.usernameController.text != '')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: StreamBuilder<
                                              List<AdministrativeRecord>>(
                                            stream: queryAdministrativeRecord(
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
                                              List<AdministrativeRecord>
                                                  stackAdministrativeRecordList =
                                                  snapshot.data!;
                                              final stackAdministrativeRecord =
                                                  stackAdministrativeRecordList
                                                          .isNotEmpty
                                                      ? stackAdministrativeRecordList
                                                          .first
                                                      : null;
                                              return SizedBox(
                                                width: 18.0,
                                                height: 18.0,
                                                child: Stack(
                                                  children: [
                                                    if (!stackAdministrativeRecord!
                                                        .usernames
                                                        .contains(_model
                                                            .usernameController
                                                            .text))
                                                      const Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Icon(
                                                          Icons
                                                              .check_circle_outlined,
                                                          color:
                                                              Color(0xFF3BBE3B),
                                                          size: 18.0,
                                                        ),
                                                      ),
                                                    if (stackAdministrativeRecord
                                                            .usernames
                                                            .contains(_model
                                                                .usernameController
                                                                .text) ??
                                                        true)
                                                      const Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Icon(
                                                          Icons.close_rounded,
                                                          color:
                                                              Color(0xFFF83639),
                                                          size: 18.0,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      40.0, 12.0, 40.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (!columnAdministrativeRecord!.usernames
                                          .contains(
                                              _model.usernameController.text)) {
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        FFAppState().update(() {
                                          FFAppState().signupUsername =
                                              _model.usernameController.text;
                                        });

                                        context.goNamed(
                                          'SignUp_UsernameConfirmation',
                                          queryParameters: {
                                            'gender': serializeParam(
                                              widget.gender,
                                              ParamType.String,
                                            ),
                                            'age': serializeParam(
                                              widget.age,
                                              ParamType.double,
                                            ),
                                            'weight': serializeParam(
                                              widget.weight,
                                              ParamType.double,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                            fontSize: 14.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                3.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed(
                                  'Login',
                                  queryParameters: {
                                    'gender': serializeParam(
                                      widget.gender,
                                      ParamType.String,
                                    ),
                                    'age': serializeParam(
                                      widget.age,
                                      ParamType.double,
                                    ),
                                    'weight': serializeParam(
                                      widget.weight,
                                      ParamType.double,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.leftToRight,
                                    ),
                                  },
                                );
                              },
                              child: Text(
                                'Sign In.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontWeight: FontWeight.w500,
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
      ),
    );
  }
}
