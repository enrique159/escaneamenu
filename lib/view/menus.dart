import 'package:escaneamenu/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class Menus extends StatefulWidget {
  Menus({Key key}) : super(key: key);

  @override
  _MenusState createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar('Mis Menús'),
        body: Container(
        child: Center(
          child: Text('Hola'),
        ),
      ),
    );
  }
}