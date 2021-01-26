import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(child: Text("You Made it",style: TextStyle(color: Colors.lightGreen,fontSize: 40,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),
      ),
    );
  }
}
