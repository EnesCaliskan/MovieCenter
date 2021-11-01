import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';

class BookmarkScreen extends StatefulWidget {
  static const int pageNumber = 1;
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLessDarkBlack,
      child: Center(
        child: Text('Bookmark Page'),
      ),
    );
  }
}
