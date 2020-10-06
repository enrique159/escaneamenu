import 'dart:typed_data';
import 'dart:async';
import 'package:escaneamenu/constants.dart';
import 'package:escaneamenu/view/webexample.dart';
import 'package:escaneamenu/view/webviewercontainer.dart';
import 'package:escaneamenu/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:string_validator/string_validator.dart';


class Scan extends StatefulWidget {
  Scan({Key key}) : super(key: key);

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  Uint8List bytes = Uint8List(0);
  TextEditingController _outputController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Escanea'),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/using_phone.svg',
                      height: kSpacingUnit * 18,
                    )
                  ],
                ),
                SizedBox(
                  height: kSpacingUnit * 2,
                ),
                Text(
                  "Escanea el código QR",
                  style: kTitleTextStyle,
                ),
                Text(
                  "Selecciona una de las opciones para escanear el código QR de tu mesa",
                  style: kNormalTextStyle,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => _scan(),
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
                                Icon(Icons.camera_alt),
                                SizedBox(height: 12),
                                Text(
                                  "Cámara",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => _scanPhoto(),
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
                                Icon(Icons.image),
                                SizedBox(height: 12),
                                Text(
                                  "Galería",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewExample(url: url,)));
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    this._outputController.text = barcode;
    if (isURL(this._outputController.text)) {
      _handleURLButtonPress(context, this._outputController.text);
    } else {
      final snackBar = SnackBar(
          content:
              Text('Esto no es un sitio web: ' + this._outputController.text));
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  Future _scanPhoto() async {
    String barcode = await scanner.scanPhoto();
    this._outputController.text = barcode;
  }

/*   Future _scanPath(String path) async {
    String barcode = await scanner.scanPath(path);
    this._outputController.text = barcode;
  }

  Future _scanBytes() async {
    // ignore: deprecated_member_use
    File file = await ImagePicker.pickImage(source: ImageSource.camera);
    Uint8List bytes = file.readAsBytesSync();
    String barcode = await scanner.scanBytes(bytes);
    this._outputController.text = barcode;
  } */
}
