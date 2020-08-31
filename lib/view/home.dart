import 'package:escaneamenu/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: true,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: TabBarView(
              children: [
                new Container(
                  color: Colors.yellow,
                ),
                new Container(
                  color: Colors.orange,
                ),
                new Container(
                  color: Colors.lightGreen,
                ),
              ],
            ),
            bottomNavigationBar: new TabBar(
              tabs: [
                Tab(
                  icon: new Icon(Icons.center_focus_weak),
                ),
                Tab(
                  icon: new Icon(Icons.restaurant_menu),
                ),
                Tab(
                  icon: new Icon(Icons.settings),
                ),
              ],
              labelColor: kCoralColor,
              unselectedLabelColor: kDarkGreyColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: kCoralColor,
            ),
          ),
        ),
      ),
    );
  }
}
