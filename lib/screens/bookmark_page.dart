import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/providers/movie_provider.dart';
import 'package:movie_center/services/build_movie_screen_service.dart';
import 'package:movie_center/widgets/bookmark_widgets/page_title.dart';
import 'package:provider/provider.dart';
import 'movie_screen.dart';

class BookmarkScreen extends StatefulWidget {
  static const int pageNumber = 1;
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {

  Widget _buildGridViewItem(BuildContext context, DocumentSnapshot document){
    var movieProvider = Provider.of<MovieProvider>(context);
    BuildMovieScreenService movieScreenService = BuildMovieScreenService();
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width,
          child: ListTile(
            onTap: (){
              movieScreenService.buildMovieScreen(context, document, movieProvider);
            },
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(document['poster']),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(document['name'], style: TextStyle(
            fontSize: 18.0,
            color: kDifferentOrange
          ),),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLessDarkBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageTitle(pageTitle: 'Bookmarked Movies'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('bookmarks').snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData) return Center(child: CircularProgressIndicator(color: kDifferentOrange,),);

                  return GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20.0,
                        crossAxisCount: 3,
                        childAspectRatio: 0.4,
                      ),
                      itemBuilder: (context, index){
                          return _buildGridViewItem(context, snapshot.data!.docs[index]);
                      }
                  );
                }
              ),
            ),
          ),
        ],
      )
    );
  }
}
