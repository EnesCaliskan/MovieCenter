import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/providers/movie_provider.dart';
import 'package:provider/provider.dart';

final _firestore = FirebaseFirestore.instance;

class MovieScreenTopButtonRow extends StatefulWidget {
  const MovieScreenTopButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieScreenTopButtonRow> createState() => _MovieScreenTopButtonRowState();
}

class _MovieScreenTopButtonRowState extends State<MovieScreenTopButtonRow> {

  SnackBar snackBar(String isMovieExists){
    return SnackBar(
        duration: Duration(milliseconds: 700),
        backgroundColor: kDarkBlack,
        content: Text(
          isMovieExists == 'true' ? 'Movie has been removed' : 'Movie added to bookmarks',
          style: TextStyle(color: kDifferentOrange, fontSize: 18.0),
        ),
    );
  }

  //check if the movie in that name already exists
  Future<bool> doesMovieAlreadyExists(String name) async{
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('bookmarks')
        .where('name', isEqualTo: name)
        .limit(1)
        .get();

    final List<DocumentSnapshot> documents = result.docs;
    return documents.length == 1;
  }

  @override
  Widget build(BuildContext context) {
    var movieProvider = Provider.of<MovieProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            iconSize: 25.0,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          FutureBuilder(
            future: doesMovieAlreadyExists(movieProvider.movieName),
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return const CircularProgressIndicator();
              }
              return IconButton(
                icon: Icon(Icons.bookmark),
                color: Colors.white,
                iconSize: 25.0,
                onPressed: () {
                  //if movie exists remove the movie from the bookmarks
                  if(snapshot.data == true){
                    _firestore.collection('bookmarks')
                    .where('name', isEqualTo: movieProvider.movieName)
                    .get().then((value){
                      value.docs.forEach((element) {
                        FirebaseFirestore.instance.collection('bookmarks').doc(element.id)
                            .delete().then((value){
                              print('movie deleted');
                        });
                      });
                    });
                  }
                  //if movie doesn't exists add the movie
                  else{
                    _firestore.collection('bookmarks').add({
                      'name': movieProvider.movieName,
                      'category': movieProvider.category,
                      'poster': movieProvider.imageUrl,
                      'rating': movieProvider.rating,
                      'year': movieProvider.year,
                      'writer': movieProvider.writer,
                      'director': movieProvider.director,
                      'description': movieProvider.description,
                      'cast': movieProvider.topCast,
                      'cast_image': movieProvider.castImage,
                    });
                  }
                  ScaffoldMessenger.of(context).
                  showSnackBar(snackBar(snapshot.data.toString()));
                },
              );
            }
          )
        ],
      ),
    );
  }
}