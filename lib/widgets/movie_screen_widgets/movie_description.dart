import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/providers/movie_provider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class FilmDescription extends StatelessWidget {
  const FilmDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieProvider = Provider.of<MovieProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Movie Description',
          style: TextStyle(
              color: kDifferentOrange,
              fontSize: 22.0,
          ),
        ),
        ReadMoreText(
          movieProvider.description,
          trimLines: 3,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
          colorClickableText: kDifferentOrange,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}