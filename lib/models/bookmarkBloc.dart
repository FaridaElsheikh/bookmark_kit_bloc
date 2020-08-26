import 'dart:async';

import 'file:///D:/FlutterProjects/bookmark_kit_bloc/lib/models/bookmark.dart';

import '../logic/bookmark_API.dart';

class BookmarkBloc {
  final _streamController = StreamController<List<Bookmark>>();

  set controller(List<Bookmark> Bookmarks) {
    _streamController.sink.add(Bookmarks);
  }

  Stream<List<Bookmark>> get bookmarkStream => _streamController.stream;

  void updateBookmarkList(){
    BookmarkAPI().fetchBookmarks().then((value) {
      controller=value.cast<Bookmark>();
    });
  }


}