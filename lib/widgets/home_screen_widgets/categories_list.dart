import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/screens/category_screen.dart';
import 'package:movie_center/services/category_list_service.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {

  CategoryImageService categoryImageService = CategoryImageService();

  Widget _buildListItem(BuildContext context, String category){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            child: ListTile(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CategoryScreen(selectedCategory: category),
                    ),
                );
              },
            ),
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  categoryImageService.setCategoryImage(category),
                ),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
          ),
        ),
        Text(
          category,
          style: TextStyle(
          fontSize: 18.0,
          color: kDifferentOrange,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Text('Categories', style: TextStyle(fontSize: 22.0, color: kDifferentOrange),
          ),
        ),
        SizedBox(
          height: 150.0,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('movies').snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) return const CircularProgressIndicator();

              List categories = [];
              for(int i=0;i<snapshot.data!.docs.length;i++){
                categories.add(snapshot.data!.docs[i]['category']);
              }
              List uniqueCategories = categories.toSet().toList();
              return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: uniqueCategories.length,
                      itemBuilder: (context, index) {
                        return _buildListItem(context, uniqueCategories[index]);
                      }
                  );
            }
          ),
        ),
      ],
    );
  }
}

