import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/bookmark.dart';
import 'bookmarkContentPage.dart';

class BookmarkListPage extends StatelessWidget {
  final List bookmarks;

  BookmarkListPage(this.bookmarks);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: bookmarks == null ? 0 : bookmarks.length,
        itemBuilder: (context, int bookmarkIndex) {
          return _buildListView(context, bookmarks, bookmarkIndex);
        });
  }
}

Widget _buildListView(
    BuildContext context, List<Bookmark> bookmarks, int bookmarkIndex) {
  return Container(
    height: 200,
    child: Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookMarkScreen(
                  bookmark: bookmarks[bookmarkIndex],
                ),
              ));
        },
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(child: _buildTitleDescription(bookmarks, bookmarkIndex)),
              _buildImage(bookmarks, bookmarkIndex)
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildTitleDescription(List<Bookmark> bookmarks, int bookmarkIndex) {
  return Container(
    padding: EdgeInsets.all(12),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            bookmarks[bookmarkIndex].title,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            bookmarks[bookmarkIndex].description,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
        ]),
  );
}

Widget _buildImage(List<Bookmark> bookmarks, int bookmarkIndex) {
  return Container(
    padding: EdgeInsets.only(right: 12, top: 8, bottom: 8),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        bookmarks[bookmarkIndex].urlToImage,
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    ),
  );
}
