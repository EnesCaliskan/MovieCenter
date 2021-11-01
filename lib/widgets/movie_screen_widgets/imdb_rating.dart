import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';

class ImdbRating extends StatelessWidget {
  const ImdbRating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            color: Colors.yellow
        ),
        child: Text('IMDB 7.0',
          style: TextStyle(
            color: kLessDarkBlack,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}