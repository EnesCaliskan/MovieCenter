import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'movie_screen.dart';

class BookmarkScreen extends StatefulWidget {
  static const int pageNumber = 1;
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {

  Widget movie(){
    return Container(
      child: ListTile(
        onTap: (){
          Navigator.pushNamed(context, MovieScreen.id);
        },
      ),
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Filbert.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15.0),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLessDarkBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:20.0, top: 50.0, bottom: 10.0),
            child: Text('Bookmarked Movies',
                style: TextStyle(
                  fontSize: 24.0,
                  color: kDifferentOrange,
                ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: GridView.count(
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                crossAxisCount: 3,
                children: [
                  movie(),
                  movie(),
                  movie(),
                  movie(),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
