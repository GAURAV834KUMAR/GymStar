import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'agee_model.dart';
export 'agee_model.dart';

class AgeeWidget extends StatefulWidget {
  const AgeeWidget({
    super.key,
    required this.gender,
  });

  final String? gender;

  @override
  _AgeeWidgetState createState() => _AgeeWidgetState();
}

class _AgeeWidgetState extends State<AgeeWidget> {
  late AgeeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgeeModel());

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
        backgroundColor: FlutterFlowTheme.of(context).intro,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            context.pushNamed(
              'Weight',
              queryParameters: {
                'gender': serializeParam(
                  widget.gender,
                  ParamType.String,
                ),
                'age': serializeParam(
                  _model.sliderValue,
                  ParamType.double,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.rightToLeft,
                  duration: Duration(milliseconds: 300),
                ),
              },
            );
          },
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          icon: const Icon(
            Icons.play_arrow_rounded,
            color: Colors.black,
          ),
          elevation: 8.0,
          label: Text(
            ' NEXT',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'HOW OLD ARE YOU ?',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'THIS HELP US CREATE YOUR PERSONALIZED PLAN',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 10.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 100.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        formatNumber(
                          _model.sliderValue,
                          formatType: FormatType.custom,
                          format: '##',
                          locale: '',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'year',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliderTheme(
                data: const SliderThemeData(
                  showValueIndicator: ShowValueIndicator.always,
                ),
                child: Slider(
                  activeColor: FlutterFlowTheme.of(context).secondary,
                  inactiveColor: FlutterFlowTheme.of(context).alternate,
                  min: 1.0,
                  max: 100.0,
                  value: _model.sliderValue ??= 18.0,
                  label: _model.sliderValue.toString(),
                  onChanged: (newValue) {
                    newValue = double.parse(newValue.toStringAsFixed(0));
                    setState(() => _model.sliderValue = newValue);
                  },
                ),
              ),
            ].divide(const SizedBox(height: 50.0)).around(const SizedBox(height: 50.0)),
          ),
        ),
      ),
    );
  }
}
