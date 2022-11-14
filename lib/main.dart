import 'package:flutter/material.dart';
import 'package:konversi_suhu/result.dart';
import 'package:konversi_suhu/convert.dart';

import 'input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();

  double _celcius = 0;
  double _kelvin = 0;
  double _reamor = 0;

  void _konversiSuhu() {
    setState(() {
      _celcius = double.parse(etInput.text);
      _kelvin = _celcius + 273;
      _reamor = (4 / 5) * _celcius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Qalbii Konversi Suhu Projek"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Input(etInput: etInput),
              Result(kelvin: _kelvin, reamor: _reamor),
              Convert(konvertHandler: _konversiSuhu)
            ],
          ),
        ),
      ),
    );
  }
}
