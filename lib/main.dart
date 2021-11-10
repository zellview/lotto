import 'package:flutter/material.dart';
import 'dart:math';

var rng = new Random(1);
var taken = [];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zellview Lotto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: MyHomePage(title: 'zellview-lotto'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() { return _MyHomePageState(); }
}

class Lottozahl extends StatelessWidget {
  var no = 0;

  @override
  Widget build(BuildContext context) {
    do {
      no = 1 + rng.nextInt(49);
    } while (taken.contains(no));
    taken.add(no);

    return Container(
     width: 80,
      height: 80,
      alignment:Alignment.center,
      decoration: BoxDecoration(
        color: Colors.yellow,
        // color: Colors.deepPurple,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
      child: Text(no.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {

  void _NeueZiehung() {
    setState((){
      taken = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var i = 0; i < 6 ; i++)  Lottozahl(),
            ],
          ),
        ]),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _NeueZiehung,
        tooltip: 'Neue Ziehung',
        child: Icon(Icons.add),
      ),
    );
  }
}
