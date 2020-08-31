import 'package:escaneamenu/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  Config({Key key}) : super(key: key);

  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar('Ajustes'),
        body: Container(
        child: Center(
          child: Text('Hola'),
        ),
      ),
    );
  }
}
