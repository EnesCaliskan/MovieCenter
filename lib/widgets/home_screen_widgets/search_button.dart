import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){ },
      icon: Icon(Icons.search, color: kDifferentOrange, size: 26.0,)
    );
  }
}
