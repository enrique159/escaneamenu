import 'package:escaneamenu/constants.dart';
import 'package:flutter/material.dart';

class ButtonScan extends StatelessWidget {
  final Icon icono;
  final String texto;
  const ButtonScan({Key key, this.icono, this.texto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(18.0),
        focusColor: kCoralColor,
        splashColor: kCoralColor,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.only(
                bottom: kSpacingUnit,
                left: kSpacingUnit * 2,
                right: kSpacingUnit * 2,
                top: kSpacingUnit * 1.5),
            child: Column(
              children: [
                this.icono,
                SizedBox(height: 12),
                Text(
                  this.texto,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
