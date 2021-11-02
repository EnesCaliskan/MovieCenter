import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class MainMovieImage extends StatefulWidget {
  const MainMovieImage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainMovieImage> createState() => _MainMovieImageState();
}

class _MainMovieImageState extends State<MainMovieImage> {
  @override
  Widget build(BuildContext context) {
        var movieProvider = Provider.of<MovieProvider>(context);
        return ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  kLessDarkBlack.withOpacity(0.7),
                  kLessDarkBlack.withOpacity(0.5),
                  kLessDarkBlack.withOpacity(0.2),
                  kLessDarkBlack.withOpacity(0.0),
                ],
                stops: [0.0, 0.5,0.80, 1.0],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(movieProvider.imageUrl),
            )
        );
      }
  }
