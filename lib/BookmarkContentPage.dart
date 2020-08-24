import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bookmark.dart';

class BookMarkScreen extends StatelessWidget {
  final Bookmark bookmark;

  BookMarkScreen({this.bookmark});

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: <Widget>[
          Text(
            bookmark.title,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(right: 12, top: 8, bottom: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                bookmark.urlToImage,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            bookmark.description,
            style: TextStyle(fontSize: 15),
          ),
        ]),
      ),
    );
  }
}
