import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'filter_category_sheet_model.dart';
export 'filter_category_sheet_model.dart';

class FilterCategorySheetWidget extends StatefulWidget {
  const FilterCategorySheetWidget({
    super.key,
    required this.onSelect,
  });

  final Future Function()? onSelect;

  @override
  State<FilterCategorySheetWidget> createState() =>
      _FilterCategorySheetWidgetState();
}

class _FilterCategorySheetWidgetState extends State<FilterCategorySheetWidget> {
  late FilterCategorySheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterCategorySheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Text(
                  'Catégorie',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                      ),
                ),
              ),
            ),
            StreamBuilder<List<CategoriesRecord>>(
              stream: queryCategoriesRecord(
                queryBuilder: (categoriesRecord) =>
                    categoriesRecord.orderBy('order'),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitThreeBounce(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 50.0,
                      ),
                    ),
                  );
                }
                List<CategoriesRecord> listViewCategoriesRecordList =
                    snapshot.data!;

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewCategoriesRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewCategoriesRecord =
                        listViewCategoriesRecordList[listViewIndex];
                    return Container(
                        width: 100, height: 100, color: Colors.green);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
