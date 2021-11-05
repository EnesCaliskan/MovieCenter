import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/providers/movie_provider.dart';
import 'package:provider/provider.dart';

import 'movie_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.selectedCategory}) : super(key: key);
  final String selectedCategory;

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  Widget _buildListViewItem(BuildContext context, DocumentSnapshot document){
    var movieProvider = Provider.of<MovieProvider>(context);
      TextStyle listTileStyle(FontWeight fontWeight){
        return TextStyle(
            color: kDarkBlack,
            fontSize: 22.0,
            fontWeight: fontWeight
        );
      }
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 7,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [kOrange, kDifferentOrange],
            ),
            border: Border.all(color: kDifferentOrange),
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: NetworkImage(document['poster']),
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 5,
                child: ListTile(
                  title: Text(document['name'],
                    style: listTileStyle(FontWeight.bold),
                  ),
                  subtitle: Text(
                    'IMDB ${document['rating']}',
                    style: listTileStyle(FontWeight.w500),
                  ),
                  onTap: (){
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
                  },
                ),
              ),
            ],
          )
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kLessDarkBlack,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: kDifferentOrange,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  Text('Categories',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: kDifferentOrange,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('movies')
                    .where('category', isEqualTo: widget.selectedCategory)
                    .snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData) return const Text('Loading...');
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => _buildListViewItem(context, snapshot.data!.docs[index]),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
