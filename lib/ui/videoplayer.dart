import 'package:mood_maker/ui/vedio.dart';

import 'package:flutter/material.dart';
import 'package:mood_maker/main.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//import 'package:toast/toast.dart';

var vedio = 1;
var swap_v = 0;
var swap_l = 1;
var swap_a = 1;

setvedio(int a) {
  vedio = a;
}

swapicon_like() {
  if (swap_l == 0) {
    return Icon(
      Icons.favorite,
      size: 30,
    );
  } else {
    return Icon(
      Icons.favorite,
      color: Colors.red,
      size: 30,
    );
  }
}

swapicon_play() {
  if (swap_v == 0) {
    return Icon(
      Icons.play_arrow,
      size: 40,
    );
  } else {
    return Icon(
      Icons.pause,
      size: 30,
    );
  }
}

swapicon_sound() {
  if (swap_a == 0) {
    return Icon(
      Icons.volume_off,
      size: 30,
    );
  } else {
    return Icon(
      Icons.volume_up,
      size: 30,
    );
  }
}

imageset() {
  if (vedio == 1) {
    return Image.network(
      "https://i.ytimg.com/vi/zXLgYBSdv74/maxresdefault.jpg",
      fit: BoxFit.contain,
    ); //ik vaari
  } else if (vedio == 2) {
    return Image.network(
      "https://c-sf.smule.com/rs-s79/arr/c4/e8/c2fd8406-d29d-4bea-a18b-e81c98fd0eb6_1024.jpg",
      fit: BoxFit.contain,
      height: 200,
    ); // kaun tujhe
  } else if (vedio == 3) {
    return Image.network(
      "https://static.spotboye.com/uploads/vicky-nora-tnail_2019-8-16-11-52-58_thumbnail.jpg",
      fit: BoxFit.contain,
    ); //bada pachtaoge
  } else if (vedio == 4) {
    return Image.network(
      "https://i.ytimg.com/vi/wF_B_aagLfI/hqdefault.jpg",
      fit: BoxFit.contain,
    ); // teri mitti
  } else if (vedio == 5) {
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

vedioadd() {
  if (vedio >= 5)
    vedio = 1;
  else
    ++vedio;
  print(vedio);
}

vediosub() {
  if (vedio <= 1)
    vedio = 5;
  else
    --vedio;
  print(vedio);
}

player(context) {
  if (swap_v == 0) {
    return imageset();
  } else {
    loadurl();
    print(Url);
    return Navigator.of(context).pushNamed('/new');
  }
}

class MyViedeoPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: formatcolor()[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new FloatingActionButton(
                onPressed: () {
                  vediosub();
                  Navigator.of(context).pushNamed('/vedioplayer');
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
                  onPressed: () => Navigator.of(context).pushNamed('/home'),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  vedioadd();
                  Navigator.of(context).pushNamed('/vedioplayer');
                },
                child: Icon(Icons.arrow_forward_ios),
                heroTag: 'right',
                backgroundColor: formatcolor()[900],
                focusColor: formatcolor()[600],
              ),
            ],
          ),
          new Container(
            margin: EdgeInsets.all(20),
            color: formatcolor(),
            child: new Container(
              width: double.maxFinite,
              height: 200,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: formatcolor(),
              ),
              child: player(context),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: formatcolor(), borderRadius: BorderRadius.circular(50)),
            height: 100,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/vedioplayer');
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
                    Navigator.of(context).pushNamed('/vedioplayer');
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
                    Navigator.of(context).pushNamed('/vedioplayer');
                  },
                  heroTag: "like",
                  backgroundColor: formatcolor()[900],
                  child: swapicon_like(),
                ),
                new FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/vedioplayer');
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
                    Navigator.of(context).pushNamed('/vedioplayer');
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          " Vedio     : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              backgroundColor: formatcolor()[100],
                              fontSize: 22),
                        ),
                        Text(
                          " Unknown ",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              backgroundColor: formatcolor()[100],
                              fontSize: 22),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          " Singer    : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              backgroundColor: formatcolor()[100],
                              fontSize: 22),
                        ),
                        Text(
                          " Unknown ",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              backgroundColor: formatcolor()[100],
                              fontSize: 22),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          " Duration : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              backgroundColor: formatcolor()[100],
                              fontSize: 22),
                        ),
                        Text(
                          " Unknown ",
                          style: TextStyle(
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
          ),
        ],
      ),
    );
  }
}
