import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mood_maker/main.dart';
//import 'package:toast/toast.dart';

var song = 1;
var swap = 1;

setsong(int a) {
  song = a;
}

swapicon() {
  if (swap == 0) {
    swap = 1;
    return Icon(Icons.play_arrow);
  } else {
    swap = 0;
    return Icon(Icons.pause);
  }
}

final assetsAudioPlayer = AssetsAudioPlayer();
imageset() {
  if (song == 1) {
    return Image.network(
      "https://i.ytimg.com/vi/zXLgYBSdv74/maxresdefault.jpg",
      fit: BoxFit.contain,
    ); //ik vaari
  } else if (song == 2) {
    return Image.network(
      "https://c-sf.smule.com/rs-s79/arr/c4/e8/c2fd8406-d29d-4bea-a18b-e81c98fd0eb6_1024.jpg",
      fit: BoxFit.contain,
      height: 200,
    ); // kaun tujhe
  } else if (song == 3) {
    return Image.network(
      "https://static.spotboye.com/uploads/vicky-nora-tnail_2019-8-16-11-52-58_thumbnail.jpg",
      fit: BoxFit.contain,
    ); //bada pachtaoge
  } else if (song == 4) {
    return Image.network(
      "https://i.ytimg.com/vi/wF_B_aagLfI/hqdefault.jpg",
      fit: BoxFit.contain,
    ); // teri mitti
  } else if (song == 5) {
    return Image.network(
      "https://m.media-amazon.com/images/I/81df9co6SQL._SS500_.jpg",
      fit: BoxFit.contain,
      height: 200,
    ); //bahti hawa
  } else
    return Image.asset(
      "assets/logo.png",
      fit: BoxFit.contain,
    ); //asset song image
}

songloader() async {
  if (song == 1) {
    assetsAudioPlayer.open(Audio("assets/Ik_vaari.mp3"));
  } else if (song == 2) {
    try {
      await assetsAudioPlayer.open(
        Audio.network(
            "https://pwdown.com/11192/02%20Kaun%20Tujhe%20(MS%20Dhoni)%20Palak%20320Kbps.mp3"), // kaun tujhe
      );
    } catch (t) {
      assetsAudioPlayer.open(Audio("assets/Kon_Tujhe.mp3"));
    }
  } else if (song == 3) {
    assetsAudioPlayer.open(
      Audio("assets/bada_pachtaoge.mp3"),
    ); //bada pachtaoge
  } else if (song == 4) {
    assetsAudioPlayer.open(Audio("assets/Teri_mitti.mp3")); // teri mitti
  } else if (song == 5) {
    try {
      await assetsAudioPlayer.open(Audio.network(
              "https://pwdown.com/113360/03.%20Behti%20Hawa%20Sa%20Tha%20Woh.mp3") //bahti hawa
          );
    } catch (t) {
      assetsAudioPlayer.open(Audio("assets/Bahti_hawa.mp3"));
    }
  } else
    assetsAudioPlayer.open(
      Audio("assets/bada_pachtaoge.mp3"),
    );
  print("Loaded Song ");
  print(song);
}

songadd() {
  if (song >= 5)
    song = 1;
  else
    ++song;
  print(song);
}

songsub() {
  if (song <= 1)
    song = 5;
  else
    --song;
  print(song);
}

class MyAudioPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: formatcolor()[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Container(
            height: 20,
          ),
          new Container(
            width: double.maxFinite,
            height: 50,
            child: new FloatingActionButton(
              heroTag: "home",
              backgroundColor: formatcolor()[900],
              child: new Icon(Icons.home, size: 40),
              onPressed: () => Navigator.of(context).pushNamed('/home'),
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new FloatingActionButton(
                onPressed: () {
                  songsub();
                  songloader();
                  assetsAudioPlayer.play();
                  Navigator.of(context).pushNamed('/musicplayer');
                },
                child: new Icon(Icons.arrow_back_ios),
                heroTag: 'left',
                backgroundColor: formatcolor()[900],
              ),
              new Container(
                margin: EdgeInsets.all(20),
                color: formatcolor(),
                child: new Container(
                  width: 230,
                  height: 200,
                  margin: EdgeInsets.all(10),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: formatcolor(),
                  ),
                  child: imageset(),
                ),
              ),
              new FloatingActionButton(
                onPressed: () {
                  songadd();
                  songloader();
                  assetsAudioPlayer.play();
                  Navigator.of(context).pushNamed('/musicplayer');
                },
                child: new Icon(Icons.arrow_forward_ios),
                heroTag: 'right',
                backgroundColor: formatcolor()[900],
                focusColor: formatcolor()[600],
              ),
            ],
          ),
          new Container(
            decoration: new BoxDecoration(
                color: formatcolor(), borderRadius: BorderRadius.circular(50)),
            margin: EdgeInsets.all(5),
            height: 100,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new FloatingActionButton(
                  onPressed: () {
                    var s = assetsAudioPlayer.currentPosition;
                    print(s.value);
                    assetsAudioPlayer.forwardOrRewind(-50);
                    assetsAudioPlayer.play();

                    s = assetsAudioPlayer.currentPosition;
                    print(s.value);
                    swapicon();
                    Navigator.of(context).pushNamed('/musicplayer');
                  },
                  heroTag: "one",
                  backgroundColor: formatcolor()[900],
                  child: new Icon(Icons.skip_previous),
                ),
                new FloatingActionButton(
                  onPressed: () {
                    songloader();
                    var s = assetsAudioPlayer.currentPosition;
                    print(s.value);
                    assetsAudioPlayer.play();
                    s = assetsAudioPlayer.currentPosition;
                    print(s.value);

                    Navigator.of(context).pushNamed('/musicplayer');
                  },
                  heroTag: "two",
                  backgroundColor: formatcolor()[900],
                  child: new Icon(Icons.replay),
                ),
                new FloatingActionButton(
                  onPressed: () {
                    var s = assetsAudioPlayer.currentPosition;
                    print(s.value);
                    assetsAudioPlayer.playOrPause();
                    s = assetsAudioPlayer.currentPosition;
                    print(s.value);
                    Navigator.of(context).pushNamed('/musicplayer');
                  },
                  heroTag: "three",
                  backgroundColor: formatcolor()[900],
                  child: swapicon(),
                ),
                new FloatingActionButton(
                  onPressed: () {
                    var s = assetsAudioPlayer.currentPosition;
                    print(s.value);
                    assetsAudioPlayer.stop();
                    s = assetsAudioPlayer.currentPosition;
                    print(s.value);
                    Navigator.of(context).pushNamed('/musicplayer');
                  },
                  heroTag: "four",
                  backgroundColor: formatcolor()[900],
                  child: new Icon(Icons.stop),
                ),
                new FloatingActionButton(
                  onPressed: () {
                    var s = assetsAudioPlayer.currentPosition;
                    print(s.value);
                    assetsAudioPlayer.forwardOrRewind(50);
                    assetsAudioPlayer.play();

                    s = assetsAudioPlayer.currentPosition;
                    print(s.value);
                    swapicon();
                    Navigator.of(context).pushNamed('/musicplayer');
                  },
                  heroTag: "five",
                  backgroundColor: formatcolor()[900],
                  child: new Icon(Icons.skip_next),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.all(20),
                color: formatcolor()[800],
                child: new Container(
                  width: 100,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 100,
                  margin: EdgeInsets.all(10),
                  child: new Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              new Container(
                width: 240,
                height: 120,
                color: formatcolor()[800],
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Text(
                          " Song      : ",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              backgroundColor: formatcolor()[100],
                              fontSize: 22),
                        ),
                        new Text(
                          " Unknown ",
                          style: new TextStyle(
                              fontStyle: FontStyle.italic,
                              backgroundColor: formatcolor()[100],
                              fontSize: 22),
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Text(
                          " Singer    : ",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              backgroundColor: formatcolor()[100],
                              fontSize: 22),
                        ),
                        new Text(
                          " Unknown ",
                          style: new TextStyle(
                              fontStyle: FontStyle.italic,
                              backgroundColor: formatcolor()[100],
                              fontSize: 22),
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Text(
                          " Duration : ",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              backgroundColor: formatcolor()[100],
                              fontSize: 22),
                        ),
                        new Text(
                          " Unknown ",
                          style: new TextStyle(
                              fontStyle: FontStyle.italic,
                              backgroundColor: formatcolor()[100],
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
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
      ),
    );
  }
}
