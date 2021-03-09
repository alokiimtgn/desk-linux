import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrintApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Stateless build");
    return MaterialApp(
      home: Scaffold(
        body: FingerPrintUI(),
      ),
    );
  }
}

class FingerPrintUI extends StatefulWidget {
  @override
  _FingerPrintUIState createState() => _FingerPrintUIState();
}

class _FingerPrintUIState extends State<FingerPrintUI> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
