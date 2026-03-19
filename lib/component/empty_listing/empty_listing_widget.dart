import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'empty_listing_model.dart';
export 'empty_listing_model.dart';

class EmptyListingWidget extends StatefulWidget {
  const EmptyListingWidget({super.key});

  @override
  State<EmptyListingWidget> createState() => _EmptyListingWidgetState();
}

class _EmptyListingWidgetState extends State<EmptyListingWidget> {
  late EmptyListingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListingModel());

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: FaIcon(
            FontAwesomeIcons.infinity,
            color: FlutterFlowTheme.of(context).primary,
            size: 48.0,
          ),
        ),
        Text(
          'Aucune annonce en ligne',
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                color: FlutterFlowTheme.of(context).primary,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).titleSmallIsCustom,
              ),
        ),
      ].divide(SizedBox(height: 8.0)),
    );
  }
}
