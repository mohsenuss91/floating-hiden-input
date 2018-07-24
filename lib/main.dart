import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool opend = true;

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Flexible(
          child: Container(
            width: opend ? double.infinity : 50.0,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(25.0)),
            height: 50.0,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      opend = !opend;
                    });
                  },
                ),
                opend == true
                    ? Flexible(
                        child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: "Send a Msg",
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                        style: TextStyle(color: Colors.white),
                      ))
                    : Container(),
                opend == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildMessageInput(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView(
              reverse: true,
              children: _buildItems(),
            ),
          ),
        ],
      ),
    );
  }
}

_buildItems() {
  List<Widget> items = List<Widget>();
  for (var i = 0; i < 100; i++) {
    items.add(Container(
      // color: Colors.lightGreenAccent,
      child: ListTile(
        title: Text("item $i"),
      ),
    ));
  }
  return items;
}
