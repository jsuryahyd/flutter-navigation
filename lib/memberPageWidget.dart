import 'package:flutter/material.dart';

import 'member.dart';

class MemberPageWidget extends StatefulWidget {
  final Member member;

  MemberPageWidget(this.member) {
    if (member == null) {
      throw ArgumentError("member cannot be null. Received - $member");
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MemberPageState(this.member);
  }
}

class MemberPageState extends State<MemberPageWidget> {
  final Member member;

  MemberPageState(this.member);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(member.login)),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: Column(children: [
          new Image.network(member.avatarUrl),
          new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.green, size: 48.0),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          new RaisedButton(
              child: new Text('Press me'),
              onPressed: () {
                _showOkScreen(context);
              }),
        ]),
      ),
    );
  }

  _showOkScreen(BuildContext context) async {
    bool value = await Navigator.of(context)
        .push(new MaterialPageRoute<bool>(builder: (BuildContext context) {
      return new Padding(
          padding: new EdgeInsets.all(32.0),
          child: new Column(children: [
            new GestureDetector(
                child: new Text('Ok'),
                onTap: () {
                  Navigator.of(context).pop(true);
                }),
            new GestureDetector(
                child: new Text('Not Ok'),
                onTap: () {
                  Navigator.of(context).pop(false);
                })
          ]));
    }));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            content: new Text(
                (value != null && value) ? 'Ok was Pressed' : 'Not Ok was pressed'),
            actions: <Widget>[
              new FlatButton(
                  child: new Text('Done'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}
