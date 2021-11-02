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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              MainMovieImage(),
              MovieScreenTopButtonRow(),
              Positioned(
                left: 20.0,
                right: 20.0,
                top: MediaQuery.of(context).size.height / 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieTitle(),
                    ImdbRating(),
                    DirectorAndWriter(),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: FilmDescription(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TopCastList(),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}














