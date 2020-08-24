import 'dart:async';

import 'package:bookmark_kit_bloc/Bookmark.dart';

import 'Bookmark_API.dart';

class BookmarkBloc {
  final _streamController = StreamController<List<Bookmark>>();

  set controller(List<Bookmark> Bookmarks) {
    _streamController.sink.add(Bookmarks);
  }

  Stream<List<Bookmark>> get BookmarkStream => _streamController.stream;

  void updateBookmarkList(){
    BookmarkAPI().fetchBookmarks().then((value) {
      controller=value;
    });
  }


}