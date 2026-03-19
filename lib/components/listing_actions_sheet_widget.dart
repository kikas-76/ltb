import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'listing_actions_sheet_model.dart';
export 'listing_actions_sheet_model.dart';

class ListingActionsSheetWidget extends StatefulWidget {
  const ListingActionsSheetWidget({
    super.key,
    required this.listingDoc,
    required this.isActive,
  });

  final ListingsRecord? listingDoc;
  final bool? isActive;

  @override
  State<ListingActionsSheetWidget> createState() =>
      _ListingActionsSheetWidgetState();
}

class _ListingActionsSheetWidgetState extends State<ListingActionsSheetWidget> {
  late ListingActionsSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListingActionsSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
              ),
              Container(
                height: 16.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                  if (Navigator.of(context).canPop()) {
                    context.pop();
                  }
                  context.pushNamed(
                    CreateListingNom1Widget.routeName,
                    queryParameters: {
                      'editListingDoc': serializeParam(
                        widget.listingDoc,
                        ParamType.Document,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'editListingDoc': widget.listingDoc,
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.edit_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        Text(
                          'Modifier l\'annonce',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyLargeFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyLargeIsCustom,
                              ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              if (widget.isActive == true)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Supprimer l\'annonce'),
                              content: Text(
                                  'Cette annonce ne sera plus visible. Vous pourrez la retrouver dans vos annonces archivées.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: Text('Annuler'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: Text('Supprimer'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      await widget.listingDoc!.reference
                          .update(createListingsRecordData(
                        isActive: false,
                      ));
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Annonce supprimée',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyLargeIsCustom,
                                ),
                          ),
                          duration: Duration(milliseconds: 2000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      );
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(MyListingsWidget.routeName);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.delete_rounded,
                            color: FlutterFlowTheme.of(context).error,
                            size: 24.0,
                          ),
                          Text(
                            'Supprimer l\'annonce',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  color: FlutterFlowTheme.of(context).error,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyLargeIsCustom,
                                ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                ),
              if (widget.isActive == false)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await widget.listingDoc!.reference
                        .update(createListingsRecordData(
                      isActive: true,
                    ));
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Annonce remise en ligne',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).info,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                    if (Navigator.of(context).canPop()) {
                      context.pop();
                    }
                    context.pushNamed(MyListingsWidget.routeName);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.visibility_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          Text(
                            'Remettre en ligne',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyLargeIsCustom,
                                ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
              ),
            ].divide(SizedBox(height: 0.0)),
          ),
        ),
      ),
    );
  }
}
