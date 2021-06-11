import 'package:flutter/material.dart';

void main() {
  runApp(KmConverter());
}

class KmConverter extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Converter(),
    );
  }
}

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kilometers to miles Converter"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                width: 500,
                height: 10,
                margin: const EdgeInsets.all(10),
              ),
              Container(width: 500, height: 300),
              Container(
                  margin: EdgeInsets.only(top: 60),
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConvertationResult()),
                        );
                      },
                      child: Text(
                        "CONVERT",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

class ConvertationResult extends StatefulWidget {
  @override
  _ConvertationResultState createState() => _ConvertationResultState();
}

class _ConvertationResultState extends State<ConvertationResult> {
  String kmResult = "";
  String milesResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Convertation Result"),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 400,
                height: 100,
                child: Text(
                  "Metric Conversions",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 200,
                alignment: Alignment.center,
                child: Text(
                  "Miles is a unit of measure for length equal to 1760 yards",
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 50, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'km',
                  ),
                  onChanged: (String value) {
                    var km = double.parse(value);
                    var result = km * 0.62137;
                    setState(() {
                      kmResult = "Miles: " + result.toString();
                    });
                  },
                ),
                height: 50,
              ),
              Text(kmResult),
              Container(
                width: 200,
                alignment: Alignment.center,
                child: Text(
                  "A kilometer is a unit of length in the metric system, equivalent to one thousand meters",
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 30, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'mi',
                  ),
                  onChanged: (String value) {
                    var mi = double.parse(value);
                    var result = mi * 1.60934;
                    setState(() {
                      milesResult = "Kilometers: " + result.toString();
                    });
                  },
                ),
                height: 50,
              ),
              Text(milesResult),
            ],
          ),
        ));
  }
}
