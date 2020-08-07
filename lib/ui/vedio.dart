/*import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

//
//
//
//
//

import 'package:flick_video_player/flick_video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//
//
//
//

class VideoDemo extends StatefulWidget {
  VideoDemo() : super();
  final String title = "video Demo";
  @override
  _VideoDemoState createState() => _VideoDemoState();
}

class _VideoDemoState extends State<VideoDemo> {
  VideoPlayerController _controller;
  Future<dynamic> _intializeVideoPlayerFuture;
  @override
  void initState() {
    _controller = VideoPlayerController.network('https://youtu.be/5wh-0qYz-Bs');
    _intializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Demo"),
      ),
      body: FutureBuilder(
        future: _intializeVideoPlayerFuture,
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

//
//

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String textValue = "https://youtu.be/5wh-0qYz-Bs";
  VideoPlayerController videoController;
  Future<void> videoPlayer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Enter URL',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {
                textValue = value;
              });
            },
          ),
        ),
        Card(
          color: Colors.blue.shade800,
          child: FlatButton(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 50,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PlayVideo(
                      url: textValue,
                    );
                  },
                ),
              );
            },
          ),
          elevation: 30,
        ),
        Container(
          margin: EdgeInsets.only(top: 80, bottom: 20),
          height: 400,
          width: 400,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Card(
                  color: Colors.black,
                  margin:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 1),
                  shadowColor: Colors.black,
                  elevation: 5,
                  child: Center(
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(25),
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            border: Border.all(color: Colors.black, width: 1)),
                        child: FlickVideoPlayer(
                          flickManager: FlickManager(
                            autoPlay: false,
                            autoInitialize: true,
                            //getPlayerControlsTimeout: fun,
                            videoPlayerController:
                                VideoPlayerController.asset('video/Batman.mp4'),
                          ),
                        )),
                  )),
            ],
          ),
        )

        /*
        FutureBuilder(
          future: videoPlayer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: AspectRatio(
                  aspectRatio: videoController.value.aspectRatio,
                  child: VideoPlayer(videoController),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        /*SizedBox(
          height: 30.0,
        ),*/
        FloatingActionButton(
          onPressed: () {
            setState(() {
              if (videoController.value.isPlaying) {
                videoController.pause();
              } else {
                videoController.play();
              }
            });
          },
          child: Icon(
              videoController.value.isPlaying ? Icons.pause : Icons.play_arrow),
        ),*/
      ],
    );
  }
}

class PlayVideo extends StatelessWidget {
  PlayVideo({this.url});

  final url;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: GetVideo(
          link: url,
        ),
      ),
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
      appBar: AppBar(
        title: Text("Mood Maker Player"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

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
