import 'file:///D:/FlutterProjects/bookmark_kit_bloc/lib/models/bookmarkBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ui/bookmarkListPage.dart';

void main() {
  final BookmarkBloc _bookmarks = BookmarkBloc();
  _bookmarks.updateBookmarkList();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder(
          stream: _bookmarks.bookmarkStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return BookmarkListPage(snapshot.data);
            }
            else {
              return CircularProgressIndicator();
            }
          },
        ),
      )));
}

