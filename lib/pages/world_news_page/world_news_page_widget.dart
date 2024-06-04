import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'world_news_page_model.dart';
export 'world_news_page_model.dart';

class WorldNewsPageWidget extends StatefulWidget {
  const WorldNewsPageWidget({super.key});

  @override
  State<WorldNewsPageWidget> createState() => _WorldNewsPageWidgetState();
}

class _WorldNewsPageWidgetState extends State<WorldNewsPageWidget> {
  late WorldNewsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorldNewsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryText,
          automaticallyImplyLeading: false,
          title: Text(
            'World News',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FutureBuilder<ApiCallResponse>(
              future: (_model.apiRequestCompleter ??=
                      Completer<ApiCallResponse>()..complete(TestCall.call()))
                  .future,
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                final listViewTestResponse = snapshot.data!;
                return Builder(
                  builder: (context) {
                    final posts = TestCall.feed(
                      listViewTestResponse.jsonBody,
                    ).toList().take(10).toList();
                    return RefreshIndicator(
                      onRefresh: () async {
                        // Pull to Refresh
                        setState(() => _model.apiRequestCompleter = null);
                        await _model.waitForApiRequestCompleted();
                      },
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: posts.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 15.0),
                        itemBuilder: (context, postsIndex) {
                          final postsItem = posts[postsIndex];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(
                              '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          );
                        },
                      ),
                    );
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
