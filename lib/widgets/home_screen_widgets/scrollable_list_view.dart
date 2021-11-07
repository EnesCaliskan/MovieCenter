import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/providers/movie_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_center/services/build_movie_screen_service.dart';
import 'package:provider/provider.dart';

class ScrollableListView extends StatefulWidget {
  const ScrollableListView({Key? key}) : super(key: key);
  @override
  _ScrollableListViewState createState() => _ScrollableListViewState();
}

class _ScrollableListViewState extends State<ScrollableListView> {

  Widget _buildListItem(BuildContext context, DocumentSnapshot document){
    var movieProvider = Provider.of<MovieProvider>(context);
    BuildMovieScreenService movieScreenService = BuildMovieScreenService();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ListTile(
          onTap: (){
            movieScreenService.buildMovieScreen(context, document, movieProvider);
          },
        ),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(document['poster']),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15.0),),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Text('Movies', style: TextStyle(fontSize: 22.0, color: kDifferentOrange),),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
            .collection('movies')
            .orderBy('name')
            .snapshots(),
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: CircularProgressIndicator(
                      color: kDifferentOrange,
                    ),
                  ),
                );
              }
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) =>
                      _buildListItem(context, snapshot.data!.docs[index]),
                  );
            },

          ),
        ),
      ],
    );
  }
}
