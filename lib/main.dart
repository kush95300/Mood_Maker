import 'package:flutter/material.dart';
import 'package:mood_maker/ui/audioplayer.dart';
import 'package:mood_maker/ui/home.dart';
import 'package:mood_maker/ui/setting.dart';
import 'package:mood_maker/ui/vedio.dart';
import 'package:mood_maker/ui/videoplayer.dart';

String Url = "Sample";

main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => new Myhome(),
        "/musicplayer": (BuildContext context) => new MyAudioPlayer(),
        "/settings": (BuildContext context) => new Settings(),
        "/vedioplayer": (BuildContext context) => new MyViedeoPlayer(),
        "/new": (BuildContext context) => new PlayVideo(
              url: Url,
            ),

        //"/new2": (BuildContext context) => new App(),
      },
    ),
  );
}

var change = 1;

formatcolor() {
  if (change == 1) {
    return Colors.lightGreen;
  } else if (change == 2) {
    return Colors.lightBlue;
  } else if (change == 3) {
    return Colors.red;
  } else if (change == 4) {
    return Colors.amber;
  } else if (change == 5) {
    return Colors.deepOrange;
  } else if (change == 6) {
    return Colors.deepPurple;
  } else if (change == 7) {
    return Colors.cyan;
  } else if (change == 8) {
    return Colors.pink;
  } else {
    return Colors.grey;
  }
}

colorchange() {
  if (change >= 9) {
    change = 0;
  }
  print(change);
  return change += 1;
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new Container(
                child: new RaisedButton(
              child: new Image.asset('assets/logo.png'),
              onPressed: () => Navigator.of(context).pushNamed('/home'),
            )),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                " MOOD",
                style: TextStyle(
                  fontSize: 42,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              new Text(
                " MAKER",
                style: TextStyle(
                  fontSize: 42,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          new Text(
            "Music / Video Player App",
            style: TextStyle(fontSize: 20, color: Colors.green),
          )
        ],
      ),
    );
  }
}

loadurl() {
  if (vedio == 1) {
    Url = "https://youtu.be/zXLgYBSdv74";
  } else if (vedio == 2) {
    Url = "https://youtu.be/atVof3pjT-I";
  } else if (vedio == 3) {
    Url = "https://youtu.be/PVxc5mIHVuQ";
  } else if (vedio == 4) {
    Url = "https://youtu.be/wF_B_aagLfI";
  } else if (vedio == 5) {
    Url = "https://youtu.be/IBr798ZSOx4";
  } else {
    Url = "https://youtu.be/IBr798ZSOx4";
  }
  print("Loaded Video ");
  print(vedio);
}
