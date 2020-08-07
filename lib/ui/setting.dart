import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mood_maker/main.dart';
import 'package:toast/toast.dart';

void show(BuildContext context, int change) {
  if (change == 1) {
    Toast.show("Default : Light Green", context, duration: Toast.LENGTH_LONG);
  } else if (change == 2) {
    Toast.show("Light Blue", context, duration: Toast.LENGTH_LONG);
  } else if (change == 3) {
    Toast.show("Red", context, duration: Toast.LENGTH_LONG);
  } else if (change == 4) {
    Toast.show("Amber", context, duration: Toast.LENGTH_LONG);
  } else if (change == 5) {
    Toast.show("Deep Orange", context, duration: Toast.LENGTH_LONG);
  } else if (change == 6) {
    Toast.show("Deep Purple", context, duration: Toast.LENGTH_LONG);
  } else if (change == 7) {
    Toast.show("Cyan", context, duration: Toast.LENGTH_LONG);
  } else if (change == 8) {
    Toast.show("Pink", context, duration: Toast.LENGTH_LONG);
  } else if (change == 9) {
    Toast.show("Grey", context, duration: Toast.LENGTH_LONG);
  } else
    Toast.show("Default", context);
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Settings',
          style: new TextStyle(fontSize: 32),
        ),
        backgroundColor: formatcolor()[800],
        leading: new Icon(
          Icons.settings,
          size: 40,
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.home,
              size: 35,
            ),
            onPressed: () => Navigator.of(context).pushNamed('/home'),
          )
        ],
      ),
      body: new Container(
        margin: EdgeInsets.all(20),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: formatcolor()[800],
        ),
        child: new Container(
          margin: EdgeInsets.all(20),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: formatcolor()[600],
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: double.maxFinite,
                height: 50,
                margin: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                  color: formatcolor()[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: new Center(
                  child: new Text(
                    'Settings',
                    style: new TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              new Container(
                width: double.maxFinite,
                height: 420,
                margin: EdgeInsets.all(15),
                decoration: new BoxDecoration(
                  color: formatcolor()[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            width: double.maxFinite,
                            height: 20,
                          ),
                          new FloatingActionButton(
                            heroTag: "one",
                            onPressed: () {
                              colorchange();
                              show(context, change);
                              return Navigator.of(context)
                                  .pushNamed('/settings');
                            },
                            backgroundColor: formatcolor()[900],
                            child: new Icon(
                              Icons.brush,
                              size: 30,
                            ),
                          ),
                          new Container(
                            height: 45,
                            margin: EdgeInsets.all(10),
                            color: formatcolor()[900],
                            width: double.maxFinite,
                            child: new Card(
                              color: formatcolor()[200],
                              child: new Center(
                                child: new Text(
                                  'Theme Color Change',
                                  style: new TextStyle(
                                      fontSize: 22, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            width: double.maxFinite,
                            height: 10,
                          ),
                          new FloatingActionButton(
                            heroTag: "two",
                            onPressed: () => Toast.show(
                              "     Created by Kaushal Soni \n\n Special Thanks to Vimal Daga Sir",
                              context,
                              duration: Toast.LENGTH_LONG,
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              gravity: Toast.CENTER,
                              border:
                                  Border.all(color: formatcolor(), width: 10),
                            ),
                            backgroundColor: formatcolor()[900],
                            child: new Icon(
                              Icons.people,
                              size: 35,
                            ),
                          ),
                          new Container(
                            height: 45,
                            margin: EdgeInsets.all(10),
                            color: formatcolor()[900],
                            width: double.maxFinite,
                            child: new Card(
                              color: formatcolor()[200],
                              child: new Center(
                                child: new Text(
                                  'About Us ...',
                                  style: new TextStyle(
                                      fontSize: 22, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            width: double.maxFinite,
                            height: 10,
                          ),
                          new FloatingActionButton(
                            heroTag: "three",
                            onPressed: () => SystemChannels.platform
                                .invokeMethod('SystemNavigator.pop'),
                            backgroundColor: formatcolor()[900],
                            child: new Icon(
                              Icons.exit_to_app,
                              size: 35,
                            ),
                          ),
                          new Container(
                            height: 45,
                            margin: EdgeInsets.all(10),
                            color: formatcolor()[900],
                            width: double.maxFinite,
                            child: new Card(
                              color: formatcolor()[200],
                              child: new Center(
                                child: new Text(
                                  'Exit ',
                                  style: new TextStyle(
                                      fontSize: 22, color: Colors.black),
                                ),
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
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              new Text(
                                ' Maker',
                                style: new TextStyle(
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: formatcolor()[200],
    );
  }
}
