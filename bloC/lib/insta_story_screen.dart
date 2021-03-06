import 'package:flutter/material.dart';

class InstaStoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InstaStory(),
    );
  }
}

class InstaStory extends StatefulWidget {
  @override
  _InstaStoryState createState() => _InstaStoryState();
}

class _InstaStoryState extends State<InstaStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
      ),
    );
  }
}
