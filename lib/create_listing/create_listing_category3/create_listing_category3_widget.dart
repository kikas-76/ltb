import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'create_listing_category3_model.dart';
export 'create_listing_category3_model.dart';

class CreateListingCategory3Widget extends StatefulWidget {
  const CreateListingCategory3Widget({
    super.key,
    required this.listingRef,
    this.editListingDoc,
  });

  final DocumentReference? listingRef;
  final ListingsRecord? editListingDoc;

  static String routeName = 'CreateListingCategory3';
  static String routePath = '/createListingCategory';

  @override
  State<CreateListingCategory3Widget> createState() =>
      _CreateListingCategory3WidgetState();
}

class _CreateListingCategory3WidgetState
    extends State<CreateListingCategory3Widget> {
  late CreateListingCategory3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateListingCategory3Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.editListingDoc != null) {
        _model.selectedCategoryRef = widget.editListingDoc?.categoryRef;
        _model.selectedCategoryName = widget.editListingDoc?.categoryName;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoriesRecord>>(
      stream: queryCategoriesRecord(
        queryBuilder: (categoriesRecord) => categoriesRecord.orderBy('order'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<CategoriesRecord> createListingCategory3CategoriesRecordList =
            snapshot.data!;

        return Title(
            title: 'CreateListingCategory3',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                  actions: [],
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
                  elevation: 2.0,
                ),
                body: Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              LinearPercentIndicator(
                                percent: 0.75,
                                lineHeight: 40.0,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor:
                                    FlutterFlowTheme.of(context).primary,
                                backgroundColor:
                                    FlutterFlowTheme.of(context).accent4,
                                barRadius: Radius.circular(10.0),
                                padding: EdgeInsets.zero,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        'Choisissez une catégorie',
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
                                    Text(
                                      'Référencer votre annonce ',
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
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 55.0),
                                  child: Builder(
                                    builder: (context) {
                                      final childrenCat =
                                          createListingCategory3CategoriesRecordList
                                              .toList();

                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 12.0,
                                          mainAxisSpacing: 12.0,
                                          childAspectRatio: 1.05,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: childrenCat.length,
                                        itemBuilder:
                                            (context, childrenCatIndex) {
                                          final childrenCatItem =
                                              childrenCat[childrenCatIndex];
                                          return Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.selectedCategoryRef =
                                                    childrenCatItem.reference;
                                                _model.selectedCategoryName =
                                                    childrenCatItem.name;
                                                safeSetState(() {});
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation:
                                                    _model.selectedCategoryRef ==
                                                            childrenCatItem
                                                                .reference
                                                        ? 4.0
                                                        : 1.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          22.0),
                                                ),
                                                child: Container(
                                                  width:
                                                      _model.selectedCategoryRef ==
                                                              childrenCatItem
                                                                  .reference
                                                          ? 120.0
                                                          : 100.0,
                                                  height:
                                                      _model.selectedCategoryRef ==
                                                              childrenCatItem
                                                                  .reference
                                                          ? 120.0
                                                          : 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 18.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          6.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22.0),
                                                    border: Border.all(
                                                      color: _model
                                                                  .selectedCategoryRef ==
                                                              childrenCatItem
                                                                  .reference
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width:
                                                          _model.selectedCategoryRef ==
                                                                  childrenCatItem
                                                                      .reference
                                                              ? 4.0
                                                              : 2.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      if (_model
                                                              .selectedCategoryRef ==
                                                          childrenCatItem
                                                              .reference)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: _model
                                                                      .selectedCategoryRef ==
                                                                  childrenCatItem
                                                                      .reference
                                                              ? 70.0
                                                              : 62.0,
                                                          height: _model
                                                                      .selectedCategoryRef ==
                                                                  childrenCatItem
                                                                      .reference
                                                              ? 70.0
                                                              : 62.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                childrenCatItem
                                                                    .color,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                childrenCatItem
                                                                    .iconPath,
                                                                'https://cdn-icons-png.flaticon.com/512/69/69886.png',
                                                              ),
                                                              width: 200.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        childrenCatItem.name,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 16.0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: (_model
                                                    .selectedCategoryRef ==
                                                null)
                                            ? null
                                            : () async {
                                                unawaited(
                                                  () async {
                                                    await widget.listingRef!
                                                        .update(
                                                            createListingsRecordData(
                                                      categoryRef: _model
                                                          .selectedCategoryRef,
                                                      categoryName: _model
                                                          .selectedCategoryName,
                                                    ));
                                                  }(),
                                                );

                                                context.pushNamed(
                                                  CreateListingprix4Widget
                                                      .routeName,
                                                  queryParameters: {
                                                    'listingRef':
                                                        serializeParam(
                                                      widget.listingRef,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'editListingDoc':
                                                        serializeParam(
                                                      widget.editListingDoc,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'editListingDoc':
                                                        widget.editListingDoc,
                                                  },
                                                );
                                              },
                                        text: 'Étape Suivante',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 5.0,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Choisissez la catégorie pour aider les locataires à trouver votre objet plus vite',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmallIsCustom,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
