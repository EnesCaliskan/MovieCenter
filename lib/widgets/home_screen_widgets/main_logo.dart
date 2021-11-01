import 'package:flutter/material.dart';
import 'package:movie_center/project_assets/constants.dart';

class MainLogo extends StatefulWidget {
  const MainLogo({Key? key}) : super(key: key);

  @override
  _MainLogoState createState() => _MainLogoState();
}

class _MainLogoState extends State<MainLogo> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(seconds: 1),
        vsync: this,
    )
    ..addListener(() {
      setState(() {});
    });
    controller.forward();
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Curves.easeInOutCubic)
    );

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: animation.value,
      child: SizedBox(
        height: 50.0,
        width: 160.0,
        child: Row(
          children: [
            Icon(Icons.theaters, color: kDifferentOrange,),
            Text('Movie Center', style: TextStyle(fontSize: 22.0, color: kDifferentOrange),),
          ],
        ),
      ),
    );
  }
}
