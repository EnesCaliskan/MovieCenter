import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
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
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        child: ListTile(
                          onTap: (){
                            print('categories');
                          },
                        ),
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: kDifferentOrange,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    Text('Action', style: TextStyle(
                      color: kDifferentOrange,
                    ),),
                  ],
                );
              }
          ),
        ),
      ],
    );
  }
}

