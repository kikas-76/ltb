import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'create_listing_nom1_model.dart';
export 'create_listing_nom1_model.dart';

class CreateListingNom1Widget extends StatefulWidget {
  const CreateListingNom1Widget({
    super.key,
    this.editListingDoc,
  });

  final ListingsRecord? editListingDoc;

  static String routeName = 'CreateListingNom1';
  static String routePath = '/createListingNom';

  @override
  State<CreateListingNom1Widget> createState() =>
      _CreateListingNom1WidgetState();
}

class _CreateListingNom1WidgetState extends State<CreateListingNom1Widget> {
  late CreateListingNom1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateListingNom1Model());

    _model.productNameTextController ??=
        TextEditingController(text: widget.editListingDoc?.name);
    _model.productNameFocusNode ??= FocusNode();

    _model.descriptionTextController ??=
        TextEditingController(text: widget.editListingDoc?.description);
    _model.descriptionFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'CreateListingNom1',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
              actions: [
                Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/copie_logo_ltb_tranparent.png',
                      width: 180.0,
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
                titlePadding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              ),
              elevation: 3.0,
            ),
            body: Stack(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 90.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: LinearPercentIndicator(
                                  percent: 0.25,
                                  lineHeight: 40.0,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  progressColor:
                                      FlutterFlowTheme.of(context).primary,
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  barRadius: Radius.circular(10.0),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 0.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.editListingDoc != null
                                          ? 'Modifier l\'annonce'
                                          : 'Créer une annonce',
                                      'Créer une annonce',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .headlineSmallIsCustom,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    ' Étape 1 sur 4',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyLargeIsCustom,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 50.0, 0.0, 10.0),
                              child: Text(
                                'Quel objet souhaitez-vous louer ?',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleMediumIsCustom,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: _model.productNameTextController,
                                  focusNode: _model.productNameFocusNode,
                                  autofocus: true,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Nom',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyLargeIsCustom,
                                        ),
                                    hintText:
                                        'AirPods Pro, Perceuse Bosch, Tente 4 places…',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    errorStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).info,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 20.0, 16.0, 20.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyLargeIsCustom,
                                      ),
                                  maxLength: 30,
                                  buildCounter: (context,
                                          {required currentLength,
                                          required isFocused,
                                          maxLength}) =>
                                      null,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .productNameTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    if (!isAndroid && !isiOS)
                                      TextInputFormatter.withFunction(
                                          (oldValue, newValue) {
                                        return TextEditingValue(
                                          selection: newValue.selection,
                                          text: newValue.text.toCapitalization(
                                              TextCapitalization.sentences),
                                        );
                                      }),
                                  ],
                                ),
                                TextFormField(
                                  controller: _model.descriptionTextController,
                                  focusNode: _model.descriptionFocusNode,
                                  autofocus: true,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Description',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyLargeIsCustom,
                                        ),
                                    alignLabelWithHint: true,
                                    hintText:
                                        'Décris l’état, les accessoires, et les conditions de location…\n',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    errorStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).info,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyLargeIsCustom,
                                      ),
                                  maxLines: 9,
                                  minLines: 5,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .descriptionTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    if (!isAndroid && !isiOS)
                                      TextInputFormatter.withFunction(
                                          (oldValue, newValue) {
                                        return TextEditingValue(
                                          selection: newValue.selection,
                                          text: newValue.text.toCapitalization(
                                              TextCapitalization.sentences),
                                        );
                                      }),
                                  ],
                                ),
                              ].divide(SizedBox(height: 50.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (widget.editListingDoc != null) {
                            await widget.editListingDoc!.reference
                                .update(createListingsRecordData(
                              name: _model.productNameTextController.text,
                              description:
                                  _model.descriptionTextController.text,
                            ));

                            context.pushNamed(
                              CreateListingImage2Widget.routeName,
                              queryParameters: {
                                'listingRef': serializeParam(
                                  widget.editListingDoc?.reference,
                                  ParamType.DocumentReference,
                                ),
                                'editListingDoc': serializeParam(
                                  widget.editListingDoc,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'editListingDoc': widget.editListingDoc,
                              },
                            );
                          } else {
                            var listingsRecordReference =
                                ListingsRecord.collection.doc();
                            await listingsRecordReference
                                .set(createListingsRecordData(
                              name: _model.productNameTextController.text,
                              description:
                                  _model.descriptionTextController.text,
                              createdAt: getCurrentTimestamp,
                              ownerRef: currentUserReference,
                              isActive: false,
                            ));
                            _model.createdListing =
                                ListingsRecord.getDocumentFromData(
                                    createListingsRecordData(
                                      name:
                                          _model.productNameTextController.text,
                                      description:
                                          _model.descriptionTextController.text,
                                      createdAt: getCurrentTimestamp,
                                      ownerRef: currentUserReference,
                                      isActive: false,
                                    ),
                                    listingsRecordReference);

                            context.pushNamed(
                              CreateListingImage2Widget.routeName,
                              queryParameters: {
                                'listingRef': serializeParam(
                                  _model.createdListing?.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          }

                          safeSetState(() {});
                        },
                        text: 'Continuer',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleSmallIsCustom,
                              ),
                          elevation: 5.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
