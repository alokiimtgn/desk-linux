import 'package:flutter/material.dart';
import 'Post.dart';
import 'demo_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //1
  List list = [];
  DemoBloc bloc = DemoBloc();

  //2
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getData();
  }

  //3
  @override
  void dispose() {
    // TODO: implement deactivate
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          //6
          child: StreamBuilder<List>(
              stream: bloc.apiController,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    if (snapshot.hasData) {
                      list = snapshot.data;
                    }
                    //5
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        //4
                        return Container(
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: List.generate(list.length, (index) {
                              Post data = list[index];
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  color: Colors.orange,
                                  child: Column(
                                    children: <Widget>[
                                      Text(data.id.toString()),
                                      Text(data.thumbnailUrl),
                                      Text(data.url),
                                      Text(data.title)
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    );
                }
              }),
        ),
      ),
    );
  }
}
