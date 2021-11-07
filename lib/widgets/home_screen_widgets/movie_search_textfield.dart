import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';

class MovieSearchField extends StatefulWidget {
  const MovieSearchField({Key? key}) : super(key: key);

  @override
  _MovieSearchFieldState createState() => _MovieSearchFieldState();
}

class _MovieSearchFieldState extends State<MovieSearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:30.0, right: 30.0, bottom: 10.0),
      child: TextField(
        style: TextStyle(color: kDifferentOrange),
        onChanged: (text){ },
        decoration: InputDecoration(
          prefixIcon: IconButton(
              onPressed: (){},
              icon: Icon(Icons.search, color: kDifferentOrange,),
          ),
          hintText: 'Search for movies',
          hintStyle: TextStyle(color: kDifferentOrange),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              width: 2,
              color: kDifferentOrange,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              width: 2.0,
              color: kDifferentOrange,
            ),
          ),
        ),
      ),
    );
  }
}
