import 'package:flutter/material.dart';
import 'package:movie_center/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieProvider = Provider.of<MovieProvider>(context);
    return Text(
      movieProvider.movieName,
      style: TextStyle(
          fontSize: 48.0,
          color: Colors.white),
    );
  }
}