import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:readmore/readmore.dart';

class FilmDescription extends StatelessWidget {
  const FilmDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) '
              'interfaces for iOS and Android apps with the unified codebase.'
              'merhaba benim adim enes merhaba nasilsin ben de iyiyim tesekkur ederim'
              'bunu sirf test etmek icin yaziyorum herhangi bir anlami yok'
              'dinlediginiz icin tesekkur ederim',
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