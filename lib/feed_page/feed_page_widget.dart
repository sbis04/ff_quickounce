import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedPageWidget extends StatefulWidget {
  FeedPageWidget({Key key}) : super(key: key);

  @override
  _FeedPageWidgetState createState() => _FeedPageWidgetState();
}

class _FeedPageWidgetState extends State<FeedPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await signOut();
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPageWidget(),
                              ),
                              (r) => false,
                            );
                          },
                          child: Text(
                            'Quickounce',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Condiment',
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Icon(
                              Icons.add_box_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 20, 0),
                            child: Container(
                              width: 36,
                              height: 36,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0.77, -0.86),
                                    child: Container(
                                      width: 11,
                                      height: 11,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF0000),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 9, 0, 0),
                      child: StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord
                              .where('email', isEqualTo: currentUserEmail),
                          singleRecord: true,
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
                          List<UsersRecord> rowUsersRecordList = snapshot.data;
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
                          final rowUsersRecord = rowUsersRecordList.first;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Container(
                                    width: 90,
                                    height: 90,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment(0, 0),
                                          child: Container(
                                            width: 90,
                                            height: 90,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              rowUsersRecord.profilePicUrl,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment(1, 1),
                                          child: Container(
                                            width: 38,
                                            height: 38,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 4,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Color(0xFFFBFBFB),
                                              size: 24,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                StreamBuilder<List<FollowsRecord>>(
                                  stream: queryFollowsRecord(
                                    queryBuilder: (followsRecord) =>
                                        followsRecord.where('follower',
                                            isEqualTo:
                                                rowUsersRecord.reference),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<FollowsRecord> rowFollowsRecordList =
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
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          rowFollowsRecordList.length,
                                          (rowIndex) {
                                        final rowFollowsRecord =
                                            rowFollowsRecordList[rowIndex];
                                        return Container(
                                          width: 100,
                                          height: 100,
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: Alignment(0, 0),
                                                child: Container(
                                                  width: 90,
                                                  height: 90,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    rowFollowsRecord
                                                        .followingProfilePic,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 14.5, 0, 14.5),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Color(0x55EEEEEE),
                        ),
                      ),
                    ),
                    StreamBuilder<List<PostsRecord>>(
                      stream: queryPostsRecord(),
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
                        List<PostsRecord> listViewPostsRecordList =
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
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewPostsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewPostsRecord =
                                listViewPostsRecordList[listViewIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                            child: Container(
                                              width: 48,
                                              height: 48,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                listViewPostsRecord
                                                    .userProfilePic,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              listViewPostsRecord.username,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Lato',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 15, 0),
                                        child: Icon(
                                          Icons.keyboard_control,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Image.network(
                                  listViewPostsRecord.imageUrl,
                                  width: double.infinity,
                                  fit: BoxFit.fitWidth,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 9, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        listViewPostsRecord.numLikes.toString(),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lato',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        child: Text(
                                          'likes',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lato',
                                            fontSize: 16,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Container(
                                    width: double.infinity,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: Color(0x45EEEEEE),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 0, 17, 0),
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 17, 0),
                                            child: Icon(
                                              Icons.chat_bubble_outline,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                          Icon(
                                            Icons.send,
                                            color: Colors.white,
                                            size: 30,
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 15, 0),
                                        child: Icon(
                                          Icons.bookmark_border_outlined,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      )
                                    ],
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
      ),
    );
  }
}
