import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie_center/providers/movie_provider.dart';
import 'package:movie_center/screens/bookmark_page.dart';
import 'package:movie_center/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_center/project_assets/constants.dart';
import 'package:movie_center/screens/movie_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApplication());
}

class MainApplication extends StatefulWidget {
  const MainApplication({Key? key}) : super(key: key);

  @override
  _MainApplicationState createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {

  int currentPage = 0;
  final screens = [
    HomeScreen(),
    BookmarkScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      child: MaterialApp(
          theme: ThemeData(
            splashColor: kLightOrange,
            accentColor: kDifferentOrange,
            textTheme: GoogleFonts.oxygenTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            body: screens[currentPage],
            bottomNavigationBar: CurvedNavigationBar(
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 500),
              backgroundColor: kLessDarkBlack,
              color: kDifferentOrange,
              items: [
                Icon(Icons.movie, size: 30,),
                Icon(Icons.bookmark, size: 30,),
                Icon(Icons.star, size: 30,),
                Icon(Icons.notifications, size: 30,),
              ],
              onTap: (index){
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          routes: {
            HomeScreen.id: (context) => HomeScreen(),
            MovieScreen.id: (context) => MovieScreen(),
          },
      ),
    );
  }
}
