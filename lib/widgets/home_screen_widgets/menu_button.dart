import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {  },
      icon: Icon(Icons.menu, color: kDifferentOrange, size: 26.0,)
    );
  }
}
