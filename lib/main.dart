import 'package:bookmark_kit_bloc/BookmarkBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BookmarkListPage.dart';

void main() {
  final BookmarkBloc _bookmarks = BookmarkBloc();
  _bookmarks.updateBookmarkList();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder(
          stream: _bookmarks.BookmarkStream,
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

