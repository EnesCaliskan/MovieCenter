import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/widgets/bookmark_widgets/build_list_item.dart';
import 'package:movie_center/widgets/bookmark_widgets/page_title.dart';

class TopMoviesScreen extends StatefulWidget {
  const TopMoviesScreen({Key? key}) : super(key: key);

  @override
  _TopMoviesScreenState createState() => _TopMoviesScreenState();
}

class _TopMoviesScreenState extends State<TopMoviesScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLessDarkBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageTitle(pageTitle: 'Top Movies'),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('movies')
                  .orderBy('rating', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Center(
                    child: CircularProgressIndicator(color: kDifferentOrange,),
                  );
                }
                return ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index){
                      return BuildListItem(document: snapshot.data!.docs[index], index: index);
                    }
                );
              }
            ),
          )


        ],
      ),
    );
  }
}
