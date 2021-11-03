import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieProvider with ChangeNotifier{
  late String _movieName;
  late String _category;
  late String _rating;
  late String _imageUrl;
  late String _director;
  late String _writer;
  late String _year;
  late String _description;
  late String _topCast;
  late String _castImage;

  MovieProvider(){
    _movieName = '';
    _category = '';
    _rating = '';
    _imageUrl = '';
    _director = '';
    _writer = '';
    _year = '';
    _description = '';
    _topCast = '';
    _castImage = '';
  }

  //getters
  String get movieName => _movieName;
  String get category => _category;
  String get rating => _rating;
  String get imageUrl => _imageUrl;
  String get director => _director;
  String get writer => _writer;
  String get year => _year;
  String get description => _description;
  String get topCast => _topCast;
  String get castImage => _castImage;


  //setters
  void setMovieName(String movieName){
    _movieName = movieName;
    notifyListeners();
  }

  void setCategory(String category){
    _category = category;
    notifyListeners();
  }

  void setRating(String rating){
    _rating = rating;
    notifyListeners();
  }

  void setImageUrl(String imageUrl){
    _imageUrl = imageUrl;
    notifyListeners();
  }

  void setDirector(String director){
    _director = director;
    notifyListeners();
  }

  void setWriter(String writer){
    _writer = writer;
    notifyListeners();
  }

  void setYear(String year){
    _year = year;
    notifyListeners();
  }

  void setDescription(String description){
    _description = description;
    notifyListeners();
  }

  void setTopCast(String topCast){
    _topCast = topCast;
    notifyListeners();
  }

  void setCastImage(String castImage){
    _castImage = castImage;
    notifyListeners();
  }




}