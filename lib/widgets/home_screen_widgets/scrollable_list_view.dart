import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/providers/movie_provider.dart';
import 'package:movie_center/screens/movie_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ScrollableListView extends StatefulWidget {
  const ScrollableListView({Key? key}) : super(key: key);
  @override
  _ScrollableListViewState createState() => _ScrollableListViewState();
}

class _ScrollableListViewState extends State<ScrollableListView> {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document){
    var movieProvider = Provider.of<MovieProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ListTile(
          onTap: (){
            movieProvider.setMovieName(document['name']);
            movieProvider.setCategory(document['category']);
            movieProvider.setImageUrl(document['poster']);
            movieProvider.setDirector(document['director']);
            movieProvider.setWriter(document['writer']);
            movieProvider.setYear(document['year']);
            movieProvider.setRating(document['rating']);
            movieProvider.setDescription(document['description']);
            Navigator.pushNamed(context, MovieScreen.id);
          },
        ),
        width: 200.0,
        height: 200.0,
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
          height: 275.0,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('movies').snapshots(),
            builder: (context, snapshot){
              if(!snapshot.hasData) return const Text('Loading...');
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => _buildListItem(context, snapshot.data!.docs[index]),
                  );
            },

          ),
        ),
      ],
    );
  }
}
