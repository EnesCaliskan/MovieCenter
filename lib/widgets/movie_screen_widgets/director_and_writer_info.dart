import 'package:flutter/material.dart';

class DirectorAndWriter extends StatelessWidget {
  const DirectorAndWriter({
    Key? key,
  }) : super(key: key);

  Widget returnDefaultTitleText(String name, FontWeight fontWeight){
    return Text(
      name,
      style: TextStyle(fontSize: 16.0,
        color: Colors.white,
        fontWeight: fontWeight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          returnDefaultTitleText('Director : ', FontWeight.w200),
          returnDefaultTitleText('Filbert', FontWeight.w700),
          VerticalDivider(color: Colors.white, thickness: 1.0,),
          returnDefaultTitleText('Writer : ', FontWeight.w200),
          returnDefaultTitleText('Filbert', FontWeight.w700),
        ],
      ),
    );
  }
}