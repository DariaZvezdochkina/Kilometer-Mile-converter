import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        title: Text("KM - MILES Converter"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.black12),
          child: Column(
            children: [
              Container(
                width: 500,
                height: 540,
                margin: const EdgeInsets.all(10),
                child: Image.network(
                  'https://images.unsplash.com/photo-1532598618269-1f8b82e0e0e5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 390,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(color: Colors.greenAccent)),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConverterResult()),
                        );
                      },
                      child: Text(
                        "Convert",
                        style: TextStyle(color: Colors.white),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

class ConverterResult extends StatefulWidget {
  @override
  _ConverterResultState createState() => _ConverterResultState();
}

class _ConverterResultState extends State<ConverterResult> {
  String kmResult = "";
  String milesResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Result"),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 400,
                child: Text(
                  "Convert Kilometers to Miles & Miles to Kilometers",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 400,
                margin: EdgeInsets.only(top: 50, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter value in KM',
                  ),
                  onChanged: (String value) {
                    var kmToInt = double.parse(value);
                    var result = kmToInt * 0.621371;
                    setState(() {
                      kmResult = "Miles: " + result.toString();
                    });
                  },
                ),
                height: 50,
              ),
              Text(kmResult),
              Container(
                width: 400,
                margin: EdgeInsets.only(top: 30, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter value in Miles',
                  ),
                  onChanged: (String value) {
                    var milesToInt = double.parse(value);
                    var result = milesToInt * 1.60934;
                    setState(() {
                      milesResult = "Kilometers: " + result.toString();
                    });
                  },
                ),
                height: 50,
              ),
              Text(milesResult),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.all(10),
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      border: Border.all(color: Colors.lightBlueAccent)),
                  child: Text(
                      "A mile is equal to approximately 1.60934 kilometers. \nOne kilometers equals to 0.621371"))
            ],
          ),
        ));
  }
}
