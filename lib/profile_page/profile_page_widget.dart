import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_profile_page/edit_profile_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePageWidget extends StatefulWidget {
  ProfilePageWidget({Key key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        final profilePageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: Icon(
                              Icons.lock_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              profilePageUsersRecord.username,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lato',
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(4, 0, 0, 2),
                            child: Container(
                              width: 28,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Color(0xFF930505),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Align(
                                alignment: Alignment(0, 0),
                                child: Text(
                                  '9+',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              Icons.menu_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(12, 0, 0, 1),
                              child: Container(
                                width: 100,
                                height: 100,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment(-0.4, -0.02),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(1, 0, 0, 0),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            profilePageUsersRecord
                                                .profilePicUrl,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment(1, 1),
                                      child: Container(
                                        width: 27,
                                        height: 27,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF1062AE),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '7',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lato',
                                          fontSize: 17,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          'Posts',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lato',
                                            fontSize: 17,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '179',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lato',
                                            fontSize: 17,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 3, 0, 0),
                                          child: Text(
                                            'Followers',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lato',
                                              fontSize: 17,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '144',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lato',
                                          fontSize: 17,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          'Followers',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lato',
                                            fontSize: 17,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.55,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Align(
                                alignment: Alignment(-1, 0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        profilePageUsersRecord.displayName,
                                        textAlign: TextAlign.start,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lato',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          profilePageUsersRecord.bio,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lato',
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 18, 15, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfilePageWidget(
                                  user: profilePageUsersRecord,
                                ),
                              ),
                            );
                          },
                          text: 'Edit Profile',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 46,
                            color: Colors.black,
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Color(0x77FFFFFF),
                              fontSize: 18,
                            ),
                            borderSide: BorderSide(
                              color: Color(0x8BF1F1F1),
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.grid_on,
                              color: Color(0xCBFFFFFF),
                              size: 28,
                            ),
                            Icon(
                              Icons.location_history_outlined,
                              color: Color(0x9AFFFFFF),
                              size: 28,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 2,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                            ),
                          )
                        ],
                      ),
                      StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord.where(
                              'username',
                              isEqualTo: profilePageUsersRecord.username),
                          limit: 12,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                            );
                          }
                          List<PostsRecord> gridViewPostsRecordList =
                              snapshot.data;
                          // Customize what your widget looks like with no query results.
                          if (snapshot.data.isEmpty) {
                            return Material(
                              child: Container(
                                height: 100,
                                child: Center(
                                  child: Text('No results.'),
                                ),
                              ),
                            );
                          }
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              childAspectRatio: 1,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewPostsRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewPostsRecord =
                                  gridViewPostsRecordList[gridViewIndex];
                              return Stack(
                                children: [
                                  Image.network(
                                    gridViewPostsRecord.imageUrl,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Align(
                                    alignment: Alignment(0.85, -0.85),
                                    child: Icon(
                                      Icons.content_copy,
                                      color: Color(0xD8FFFFFF),
                                      size: 24,
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
