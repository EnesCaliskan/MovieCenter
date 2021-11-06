import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_center/providers/movie_provider.dart';
import 'package:movie_center/screens/movie_screen.dart';

class BuildMovieScreenService{

  void buildMovieScreen(BuildContext context, DocumentSnapshot document, MovieProvider movieProvider){
    movieProvider.setMovieName(document['name']);
    movieProvider.setCategory(document['category']);
    movieProvider.setImageUrl(document['poster']);
    movieProvider.setDirector(document['director']);
    movieProvider.setWriter(document['writer']);
    movieProvider.setYear(document['year']);
    movieProvider.setRating(document['rating']);
    movieProvider.setDescription(document['description']);
    movieProvider.setTopCast(document['cast']);
    movieProvider.setCastImage(document['cast_image']);
    Navigator.pushNamed(context, MovieScreen.id);
  }



}