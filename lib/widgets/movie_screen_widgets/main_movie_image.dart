import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';

class MainMovieImage extends StatelessWidget {
  const MainMovieImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              kLessDarkBlack.withOpacity(0.4),
              kLessDarkBlack.withOpacity(0.4),
              kLessDarkBlack.withOpacity(0.2),
              kLessDarkBlack.withOpacity(0.0),
            ],
            stops: [0.0, 0.5,0.70, 1.0],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: Image(
          image: AssetImage('assets/images/Filbert.png'),
        )
    );
  }
}