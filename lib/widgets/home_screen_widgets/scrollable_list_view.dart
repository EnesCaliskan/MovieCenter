import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/screens/movie_screen.dart';

class ScrollableListView extends StatefulWidget {
  const ScrollableListView({Key? key}) : super(key: key);

  @override
  _ScrollableListViewState createState() => _ScrollableListViewState();
}

class _ScrollableListViewState extends State<ScrollableListView> {
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
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
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
                  ),
                );
              }),
        ),
      ],
    );
  }
}
