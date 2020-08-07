import 'package:mood_maker/ui/audioplayer.dart';
import 'package:mood_maker/ui/home.dart';
import 'package:mood_maker/ui/setting.dart';
import 'package:mood_maker/ui/videoplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class PlayVideo extends StatelessWidget {
  PlayVideo({this.url}) {
    print(url);
  }

  final url;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GetVideo(
          link: url,
        ),
      ),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => new Myhome(),
        "/musicplayer": (BuildContext context) => new MyAudioPlayer(),
        "/settings": (BuildContext context) => new Settings(),
        "/vedioplayer": (BuildContext context) => new MyViedeoPlayer(),
        "/new": (BuildContext context) => new PlayVideo(
              url: Url,
            ),
      },
    );
  }
}

class GetVideo extends StatefulWidget {
  GetVideo({this.link});
  final link;
  @override
  _GetVideoState createState() => _GetVideoState();
}

class _GetVideoState extends State<GetVideo> {
  YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    initialize(widget.link);
  }

  void initialize(dynamic link) {
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: formatcolor()[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    child: YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        controller: controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: formatcolor(),
                        //onReady: controller.addListener(listener),
                      ),
                      builder: (context, player) {
                        return Column(
                          children: [
                            Container(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                FloatingActionButton(
                                  onPressed: () {
                                    vediosub();
                                    Navigator.of(context)
                                        .pushNamed('/vedioplayer');
                                  },
                                  child: Icon(Icons.arrow_back_ios),
                                  heroTag: 'left',
                                  backgroundColor: formatcolor()[900],
                                ),
                                Container(
                                  height: 50,
                                  child: FloatingActionButton(
                                    heroTag: "home",
                                    backgroundColor: formatcolor()[900],
                                    child: Icon(Icons.home, size: 40),
                                    onPressed: () {
                                      print("home");
                                      return Navigator.of(context)
                                          .pushNamed("/home");
                                    },
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    vedioadd();
                                    Navigator.of(context)
                                        .pushNamed('/vedioplayer');
                                  },
                                  child: Icon(Icons.arrow_forward_ios),
                                  heroTag: 'right',
                                  backgroundColor: formatcolor()[900],
                                  focusColor: formatcolor()[600],
                                ),
                              ],
                            ),
                            // some widgets
                            player,
                            Container(
                              decoration: BoxDecoration(
                                  color: formatcolor(),
                                  borderRadius: BorderRadius.circular(50)),
                              height: 100,
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  new FloatingActionButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/vedioplayer');
                                    },
                                    heroTag: "one",
                                    backgroundColor: formatcolor()[900],
                                    child: new Icon(
                                      Icons.fullscreen,
                                      size: 30,
                                    ),
                                  ),
                                  new FloatingActionButton(
                                    onPressed: () {
                                      if (swap_v == 0)
                                        swap_v = 1;
                                      else
                                        swap_v = 0;
                                      Navigator.of(context)
                                          .pushNamed('/vedioplayer');
                                    },
                                    heroTag: "play",
                                    backgroundColor: formatcolor()[900],
                                    child: swapicon_play(),
                                  ),
                                  new FloatingActionButton(
                                    onPressed: () {
                                      if (swap_l == 0)
                                        swap_l = 1;
                                      else
                                        swap_l = 0;
                                      Navigator.of(context)
                                          .pushNamed('/vedioplayer');
                                    },
                                    heroTag: "like",
                                    backgroundColor: formatcolor()[900],
                                    child: swapicon_like(),
                                  ),
                                  new FloatingActionButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/vedioplayer');
                                    },
                                    heroTag: "four",
                                    backgroundColor: formatcolor()[900],
                                    child: new Icon(Icons.stop),
                                  ),
                                  new FloatingActionButton(
                                    onPressed: () {
                                      if (swap_a == 0)
                                        swap_a = 1;
                                      else
                                        swap_a = 0;
                                      Navigator.of(context)
                                          .pushNamed('/vedioplayer');
                                    },
                                    heroTag: "mute",
                                    backgroundColor: formatcolor()[900],
                                    child: swapicon_sound(),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                new Container(
                                  margin: EdgeInsets.all(20),
                                  color: formatcolor()[800],
                                  child: new Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    height: 100,
                                    margin: EdgeInsets.all(10),
                                    child: Image.asset(
                                      'assets/logo.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                new Container(
                                  width: 240,
                                  height: 120,
                                  color: formatcolor()[800],
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text(
                                            " Vedio     : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                backgroundColor:
                                                    formatcolor()[100],
                                                fontSize: 22),
                                          ),
                                          Text(
                                            " Unknown ",
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                color: Colors.black,
                                                backgroundColor:
                                                    formatcolor()[100],
                                                fontSize: 22),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text(
                                            " Singer    : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                backgroundColor:
                                                    formatcolor()[100],
                                                fontSize: 22),
                                          ),
                                          Text(
                                            " Unknown ",
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                color: Colors.black,
                                                backgroundColor:
                                                    formatcolor()[100],
                                                fontSize: 22),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text(
                                            " Duration : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                backgroundColor:
                                                    formatcolor()[100],
                                                fontSize: 22),
                                          ),
                                          Text(
                                            " Unknown ",
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                color: Colors.black,
                                                backgroundColor:
                                                    formatcolor()[100],
                                                fontSize: 22),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Mood',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' Maker',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                            //some other widgets
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
