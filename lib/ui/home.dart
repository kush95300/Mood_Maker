import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mood_maker/ui/audioplayer.dart';

import '../main.dart';

var start = true;

class Myhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    mybody() {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Container(
            width: double.infinity,
            height: 290,
            margin: EdgeInsets.all(15),
            color: formatcolor()[900],
            child: new Card(
              color: formatcolor()[600],
              child: new Column(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(10),
                    color: formatcolor()[900],
                    child: new Card(
                      color: formatcolor()[800],
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text("  "),
                          new Icon(
                            Icons.library_music,
                            size: 40,
                            color: Colors.white,
                          ),
                          new Text(
                            " Song Playlist",
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          new IconButton(
                              padding: EdgeInsets.only(left: 50),
                              icon: new Icon(
                                Icons.playlist_play,
                                size: 50,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (start == true) {
                                  songloader();
                                  start = false;
                                }
                                Navigator.of(context).pushNamed('/musicplayer');
                              })
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.all(5),
                    color: formatcolor()[900],
                    child: new Card(
                      color: formatcolor()[50],
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            Icons.audiotrack,
                            size: 45,
                            color: formatcolor()[900],
                          ),
                          new Text(
                            " Ik Vaaari aa",
                            style: TextStyle(
                              fontSize: 26,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          new IconButton(
                            padding: EdgeInsets.only(left: 115),
                            icon: new Icon(
                              Icons.play_circle_filled,
                              size: 45,
                              color: formatcolor()[900],
                            ),
                            onPressed: () {
                              setsong(1);
                              songloader();
                              Navigator.of(context).pushNamed('/musicplayer');
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.all(5),
                    color: formatcolor()[900],
                    child: new Card(
                      color: formatcolor()[50],
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            Icons.audiotrack,
                            size: 45,
                            color: formatcolor()[900],
                          ),
                          new Text(
                            " Kaun Tujhe",
                            style: TextStyle(
                              fontSize: 26,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          new IconButton(
                            padding: EdgeInsets.only(left: 120),
                            icon: new Icon(
                              Icons.play_circle_filled,
                              size: 45,
                              color: formatcolor()[900],
                            ),
                            onPressed: () {
                              setsong(2);
                              songloader();
                              Navigator.of(context).pushNamed('/musicplayer');
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.all(5),
                    color: formatcolor()[900],
                    child: new Card(
                      color: formatcolor()[50],
                      child: new Row(
                        children: <Widget>[
                          new Icon(
                            Icons.audiotrack,
                            size: 45,
                            color: formatcolor()[900],
                          ),
                          new Text(
                            " Bade Pachtaoege",
                            style: TextStyle(
                              fontSize: 26,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          new IconButton(
                            padding: EdgeInsets.only(left: 49),
                            icon: new Icon(
                              Icons.play_circle_filled,
                              size: 45,
                              color: formatcolor()[900],
                            ),
                            onPressed: () {
                              setsong(3);
                              songloader();
                              Navigator.of(context).pushNamed('/musicplayer');
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Container(
            width: double.infinity,
            height: 230,
            margin: EdgeInsets.all(15),
            color: formatcolor()[900],
            child: new Card(
              color: formatcolor()[600],
              child: new Column(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(10),
                    color: formatcolor()[900],
                    child: new Card(
                      color: formatcolor()[800],
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text('  '),
                          new Icon(
                            Icons.ondemand_video,
                            size: 40,
                            color: Colors.white,
                          ),
                          new Text(
                            " Video Playlist",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          new IconButton(
                            padding: EdgeInsets.only(left: 50),
                            icon: new Icon(
                              Icons.video_library,
                              size: 40,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/vedioplayer');
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.all(5),
                    color: formatcolor()[900],
                    child: new Card(
                      color: formatcolor()[50],
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            Icons.videocam,
                            size: 45,
                            color: formatcolor()[900],
                          ),
                          new Text(
                            " Video 1",
                            style: TextStyle(
                              fontSize: 26,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          new IconButton(
                            padding: EdgeInsets.only(left: 160),
                            icon: new Icon(
                              Icons.play_circle_outline,
                              size: 45,
                              color: formatcolor()[900],
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed("/vedioplayer");
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.all(5),
                    color: formatcolor()[900],
                    child: Card(
                      color: formatcolor()[50],
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            Icons.videocam,
                            size: 45,
                            color: formatcolor()[900],
                          ),
                          new Text(
                            " Video 2",
                            style: TextStyle(
                              fontSize: 26,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          new IconButton(
                            padding: EdgeInsets.only(left: 160),
                            icon: new Icon(
                              Icons.play_circle_outline,
                              size: 45,
                              color: formatcolor()[900],
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed("/vedioplayer");
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Mood',
                style: new TextStyle(
                  color: Colors.red,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              new Text(
                ' Maker',
                style: new TextStyle(
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Mood Maker',
          style: TextStyle(fontSize: 28),
        ),
        backgroundColor: formatcolor()[800],
        leading: new Image.asset(
          'assets/logo.png',
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.settings),
            onPressed: () => Navigator.of(context).pushNamed('/settings'),
          ),
          new IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
          ),
        ],
      ),
      backgroundColor: formatcolor()[300],
      body: mybody(),
    );
  }
}
