import 'package:flutter/material.dart';
import 'package:movie_center/widgets/home_screen_widgets/categories_list.dart';
import 'package:movie_center/widgets/home_screen_widgets/main_logo.dart';
import 'package:movie_center/widgets/home_screen_widgets/movie_search_textfield.dart';
import 'package:movie_center/widgets/home_screen_widgets/scrollable_list_view.dart';
import 'package:movie_center/project_assets/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLessDarkBlack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
            child: MainLogo(),
          ),
          MovieSearchField(),
          CategoriesList(),
          ScrollableListView(),
        ],
      ),
    );
  }
}
