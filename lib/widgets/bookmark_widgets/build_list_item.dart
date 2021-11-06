import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/providers/movie_provider.dart';
import 'package:movie_center/services/build_movie_screen_service.dart';
import 'package:provider/provider.dart';


class BuildListItem extends StatelessWidget {
  const BuildListItem({Key? key, required this.document, required this.index}) : super(key: key);
  final DocumentSnapshot document;
  final int index;


  @override
  Widget build(BuildContext context) {
    var movieProvider = Provider.of<MovieProvider>(context);
    BuildMovieScreenService movieScreenService = BuildMovieScreenService();
    return GestureDetector(
      onTap: (){
        movieScreenService.buildMovieScreen(context, document, movieProvider);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: kDifferentOrange,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                      color: kDarkBlack,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(document['poster']),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      document['name'],
                      style: TextStyle(
                        fontSize: 24.0,
                        color: kDarkBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      document['rating'],
                      style: TextStyle(
                        fontSize: 24.0,
                        color: kDarkBlack,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
