import 'dart:typed_data';
import 'dart:async';
import 'dart:io';
import 'package:escaneamenu/constants.dart';
import 'package:escaneamenu/view/webviewer.dart';
import 'package:escaneamenu/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:string_validator/string_validator.dart';
import 'package:url_launcher/url_launcher.dart';

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
                SizedBox(height: kSpacingUnit * 2,),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 120,
                        child: InkWell(
                          onTap: _scan,
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Icon(Icons.camera_alt),
                                ),
                                Divider(height: 20),
                                Expanded(flex: 1, child: Text("Scan")),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 120,
                        child: InkWell(
                          onTap: _scanPhoto,
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Icon(Icons.camera_alt),
                                ),
                                Divider(height: 20),
                                Expanded(flex: 1, child: Text("Scan Photo")),
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
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));  
  }  

  _openUrl(url) async{
    if(await canLaunch(url)){
      print('SI JALO');
      await launch(url, forceWebView: false);
    }else{
      print('ERROOOOOOOR');
      throw 'Error no se puede abrir';
    }
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    this._outputController.text = barcode;
    if(isURL(this._outputController.text)){
      _handleURLButtonPress(context, this._outputController.text);
      // final snackBar = SnackBar(content: Text(this._outputController.text));
      // Scaffold.of(context).showSnackBar(snackBar);
    }else{
      final snackBar = SnackBar(content: Text('Esto no es un sitio web: ' + this._outputController.text));
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  Future _scanPhoto() async {
    String barcode = await scanner.scanPhoto();
    this._outputController.text = barcode;
  }

  Future _scanPath(String path) async {
    String barcode = await scanner.scanPath(path);
    this._outputController.text = barcode;
  }

  Future _scanBytes() async {
    // ignore: deprecated_member_use
    File file = await ImagePicker.pickImage(source: ImageSource.camera);
    Uint8List bytes = file.readAsBytesSync();
    String barcode = await scanner.scanBytes(bytes);
    this._outputController.text = barcode;
  }
}
