import 'package:escaneamenu/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
    @override
    final Size preferredSize;

    final String title;

    CustomAppBar(
        this.title,
        { Key key,}) : preferredSize = Size.fromHeight(72.0),
            super(key: key);

    @override
    Widget build(BuildContext context) {
        return AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                  title,
                  style: kHeadingTextStyle,
              ),
            ),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
        );
    }
}