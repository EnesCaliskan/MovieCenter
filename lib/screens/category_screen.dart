import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/widgets/bookmark_widgets/build_list_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.selectedStream}) : super(key: key);
  final Stream<QuerySnapshot<Map<String, dynamic>>> selectedStream;

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
                    icon: Icon(Icons.arrow_back_ios,
                      color: kDifferentOrange
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  Text('Movies',
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
                stream: widget.selectedStream,
                builder: (context, snapshot) {
                  if(!snapshot.hasData) return const Text('Loading...');
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          BuildListItem(document: snapshot.data!.docs[index], index: index)
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
