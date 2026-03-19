import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_booking_model.dart';
export 'empty_booking_model.dart';

class EmptyBookingWidget extends StatefulWidget {
  const EmptyBookingWidget({super.key});

  @override
  State<EmptyBookingWidget> createState() => _EmptyBookingWidgetState();
}

class _EmptyBookingWidgetState extends State<EmptyBookingWidget> {
  late EmptyBookingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyBookingModel());

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
          child: Icon(
            Icons.inventory_2_outlined,
            color: FlutterFlowTheme.of(context).primary,
            size: 48.0,
          ),
        ),
        Text(
          'Aucune demande en attente',
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
