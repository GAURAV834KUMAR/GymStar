import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'weight_model.dart';
export 'weight_model.dart';

class WeightWidget extends StatefulWidget {
  const WeightWidget({
    super.key,
    required this.gender,
    required this.age,
  });

  final String? gender;
  final double? age;

  @override
  _WeightWidgetState createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  late WeightModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeightModel());

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
              'SignUp_Name',
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
                    'WHAT\'S YOUR WEIGHT ?',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'YOU CAN ALWAYS CHANGE THIS LATER',
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
                          'Kg',
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
                  max: 650.0,
                  value: _model.sliderValue ??= 6.0,
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
