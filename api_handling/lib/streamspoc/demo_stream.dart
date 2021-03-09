import 'package:flutter/material.dart';
import 'dart:async';

main() {
  runApp(DemoStream());
}

class DemoStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: DemoStreamUI(),
        ),
      ),
    );
  }
}

class DemoStreamUI extends StatefulWidget {
  @override
  _DemoStreamUIState createState() => _DemoStreamUIState();
}

class _DemoStreamUIState extends State<DemoStreamUI> {
  int _data = 0;
  StreamController _controller = StreamController();

  // Stream get strm => _controller.stream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.orange,
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  );
                },
                stream: _controller.stream),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    child: Text("ADD"),
                    onPressed: () {
                      _controller.sink.add(++_data);
                    }),
                SizedBox(
                  width: 12,
                ),
                RaisedButton(
                    child: Text("Substract"),
                    onPressed: () {
                      _controller.sink.add(--_data);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
