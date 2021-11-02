import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';

class TopCastList extends StatelessWidget {
  const TopCastList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              itemCount: 5,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/Filbert.png'),
                        radius: 45.0,
                      ),
                    ),
                    Text('Filbert', style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                    ),
                  ],
                );
              }
          ),
        ),
      ],
    );
  }
}