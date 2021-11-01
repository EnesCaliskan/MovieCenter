import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/widgets/movie_screen_widgets/director_and_writer_info.dart';
import 'package:movie_center/widgets/movie_screen_widgets/imdb_rating.dart';
import 'package:movie_center/widgets/movie_screen_widgets/main_movie_image.dart';
import 'package:movie_center/widgets/movie_screen_widgets/movie_button_top_row.dart';
import 'package:movie_center/widgets/movie_screen_widgets/movie_description.dart';
import 'package:movie_center/widgets/movie_screen_widgets/movie_title.dart';
import 'package:movie_center/widgets/movie_screen_widgets/top_cast_list.dart';


class MovieScreen extends StatefulWidget {
  static const String id = 'movie_screen';
  const MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLessDarkBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                MainMovieImage(),
                MovieScreenTopButtonRow(),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3,
                  left: 30.0,
                  right: 30.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieTitle(),
                      ImdbRating(),
                      DirectorAndWriter(),
                      FilmDescription(),
                      TopCastList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}














