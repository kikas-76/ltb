import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filter_owner_type_sheet_model.dart';
export 'filter_owner_type_sheet_model.dart';

class FilterOwnerTypeSheetWidget extends StatefulWidget {
  const FilterOwnerTypeSheetWidget({super.key});

  @override
  State<FilterOwnerTypeSheetWidget> createState() =>
      _FilterOwnerTypeSheetWidgetState();
}

class _FilterOwnerTypeSheetWidgetState
    extends State<FilterOwnerTypeSheetWidget> {
  late FilterOwnerTypeSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterOwnerTypeSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Container(
              width: 40.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 0.0, 10.0),
              child: Text(
                'Type de propriétaire',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).titleSmallIsCustom,
                    ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 14.0, 8.0, 14.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                FFAppState().filterOwnerType = '';
                safeSetState(() {});
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).info,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 3.0, 0.0, 3.0),
                          child: Text(
                            'Tous',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                      if (FFAppState().filterOwnerType == '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.check_circle,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 20.0,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 150.0,
            child: Divider(
              height: 5.0,
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 14.0, 8.0, 14.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                FFAppState().filterOwnerType = 'particulier';
                safeSetState(() {});
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).info,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 3.0, 0.0, 3.0),
                          child: Text(
                            'Particulier',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                      if (FFAppState().filterOwnerType == 'particulier')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.check_circle,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 20.0,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 150.0,
            child: Divider(
              height: 5.0,
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 14.0, 8.0, 14.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                FFAppState().filterOwnerType = 'pro';
                safeSetState(() {});
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).info,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 3.0, 0.0, 3.0),
                          child: Text(
                            'Professionnel',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                      if (FFAppState().filterOwnerType == 'pro')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.check_circle,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 20.0,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
