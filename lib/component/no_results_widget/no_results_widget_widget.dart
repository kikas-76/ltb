import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'no_results_widget_model.dart';
export 'no_results_widget_model.dart';

class NoResultsWidgetWidget extends StatefulWidget {
  const NoResultsWidgetWidget({super.key});

  @override
  State<NoResultsWidgetWidget> createState() => _NoResultsWidgetWidgetState();
}

class _NoResultsWidgetWidgetState extends State<NoResultsWidgetWidget> {
  late NoResultsWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoResultsWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: FaIcon(
            FontAwesomeIcons.infinity,
            color: FlutterFlowTheme.of(context).primary,
            size: 50.0,
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            'Pas encore d\'objets près de chez vous',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).titleSmallIsCustom,
                ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            'Soyez le premier à publier !',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                ),
          ),
        ),
        FFButtonWidget(
          onPressed: () async {
            context.pushNamed(CreateListingNom1Widget.routeName);
          },
          text: 'Publier un objet',
          icon: Icon(
            Icons.add_circle,
            size: 24.0,
          ),
          options: FFButtonOptions(
            height: 40.0,
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                  color: Colors.white,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).titleSmallIsCustom,
                ),
            elevation: 2.0,
            borderRadius: BorderRadius.circular(16.0),
            hoverColor: FlutterFlowTheme.of(context).secondary,
            hoverTextColor: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
      ],
    );
  }
}
