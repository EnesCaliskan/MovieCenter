import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';

class PageTitle extends StatelessWidget {
  final String pageTitle;
  const PageTitle({Key? key, required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0, top: 50.0, bottom: 10.0),
      child: Text(
        pageTitle,
        style: TextStyle(
          fontSize: 24.0,
          color: kDifferentOrange,
        ),
      ),
    );
  }
}
