import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class TopCastList extends StatefulWidget {
  const TopCastList({
    Key? key,
  }) : super(key: key);

  @override
  State<TopCastList> createState() => _TopCastListState();
}

class _TopCastListState extends State<TopCastList> {

  Widget _buildListItem(BuildContext context, String castName, String castImage){

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(castImage),
            radius: 45.0,
          ),
        ),
        Text(castName, style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        ),
      ],
    );



  }


  @override
  Widget build(BuildContext context) {
    var movieProvider = Provider.of<MovieProvider>(context);
    List castList = movieProvider.topCast.split(',');
    List castImageList = movieProvider.castImage.split(',,,');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text('Top Cast', style: TextStyle(fontSize: 22.0, color: kDifferentOrange),),
        ),
        SizedBox(
          height: 150.0,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: castList.length,
              itemBuilder: (context, index) => _buildListItem(context, castList[index], castImageList[index]),
          ),
        ),
      ],
    );
  }
}