import 'package:flutter/material.dart';
import 'package:movie_center/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class DirectorAndWriter extends StatelessWidget {
  const DirectorAndWriter({
    Key? key,
  }) : super(key: key);

  Widget returnDefaultTitleText(String name, FontWeight fontWeight){
    return Text(
      name,
      style: TextStyle(fontSize: 16.0,
        color: Colors.white,
        fontWeight: fontWeight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var movieProvider = Provider.of<MovieProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              returnDefaultTitleText('Director : ', FontWeight.w200),
              returnDefaultTitleText(movieProvider.director, FontWeight.w700),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                returnDefaultTitleText('Writer : ', FontWeight.w200),
                returnDefaultTitleText(movieProvider.writer, FontWeight.w700),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                returnDefaultTitleText(movieProvider.year, FontWeight.w200),
                VerticalDivider(color: Colors.white, thickness: 1.0,),
                returnDefaultTitleText(movieProvider.category, FontWeight.w200),
              ],
            ),
          ),
        ),
      ],
    );
  }
}