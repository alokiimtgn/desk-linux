import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Home());
  }
}

class Home extends StatelessWidget {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("StoryView"),
      ),*/
      body: Container(
        margin: EdgeInsets.all(
          0,
        ),
        child: MyStoryUI(),
      ),
    );
  }
}

class MyStoryUI extends StatefulWidget {
  @override
  _MyStoryUIState createState() => _MyStoryUIState();
}

class _MyStoryUIState extends State<MyStoryUI> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: [
        // StoryItem.text(
        //   title: "First Story\non Flutter",
        //   backgroundColor: Colors.blue,
        // ),
        // StoryItem.text(
        //   title: "Welcome to Stories using Flutter .",
        //   backgroundColor: Colors.red,
        //   textStyle: TextStyle(
        //     fontFamily: 'Dancing',
        //     fontSize: 40,
        //   ),
        // ),

        StoryItem.pageImage(
            url:
                "https://media1.tenor.com/images/b9dec6676e8fa03674971f635b90498d/tenor.gif?itemid=5944611",
            caption: "Nature's Beauty",
            controller: storyController),
        StoryItem.pageImage(
          url:
              "https://media1.tenor.com/images/e3295231c1e005ccde3b98acf93f9a8e/tenor.gif?itemid=19409779",
          caption: "Chhota Bheem",
          controller: storyController,
        ),
        StoryItem.pageImage(
          url:
              "https://media1.tenor.com/images/adad84e6166e3f59ff98b029d337cbb2/tenor.gif?itemid=7609311",
          caption: "Cricket",
          controller: storyController,
        ),

        StoryItem.pageImage(
          // requestHeaders: ,
          duration: Duration(seconds: 4),
          url:
              "https://media.tenor.com/images/ab4a1d2163b6dbbfdc23c2490cdf6916/tenor.gif",
          caption: "Doremon",
          controller: storyController,
        ),

        StoryItem.text(
          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          title:
              "Stay tuned for more Flutter Stories.\nPaint your app to life in milliseconds\n"
              " with Stateful Hot Reload. \nUse a rich set of fully-customizable widgets to build \nnative interfaces in minutes.",
          backgroundColor: Colors.blue,
        ),
      ],
      onStoryShow: (s) {
        print("Showing a story");
        // storyController.next();
      },
      onComplete: () {
        print("Completed a cycle");
        //storyController.next();
      },
      progressPosition: ProgressPosition.top,
      repeat: true,
      controller: storyController,
    );
  }
}
