import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Filbert',
      style: TextStyle(
          fontSize: 48.0,
          color: Colors.white),
    );
  }
}