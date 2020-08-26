import 'dart:convert';
import 'package:bookmark_kit_bloc/resources/constants.dart';

import '../models/bookmark.dart';
import 'package:http/http.dart' as http;

class BookmarkAPI {


  Future<List<Bookmark>> fetchBookmarks() async {
    final response = await http.get(constants.url);
    List<Bookmark> bookmarks = List();

    if (response.statusCode == 200) {
      final jsonBookmarks = json.decode(response.body)['articles'];
      for (var jsonBookmark in jsonBookmarks) {
        bookmarks.add(Bookmark.fromJson(jsonBookmark));
      }
      return bookmarks;
    } else {
      throw Exception('Failed to load bookmark');
    }
  }

}
