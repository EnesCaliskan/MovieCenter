import 'package:flutter/material.dart';

class MovieScreenTopButtonRow extends StatefulWidget {
  const MovieScreenTopButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieScreenTopButtonRow> createState() => _MovieScreenTopButtonRowState();
}

class _MovieScreenTopButtonRowState extends State<MovieScreenTopButtonRow> {

  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            iconSize: 25.0,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: _isClicked ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border),
            color: Colors.white,
            iconSize: 25.0,
            onPressed: (){
                setState(() {
                  _isClicked = !_isClicked;
                });
            },
          )
        ],
      ),
    );
  }
}