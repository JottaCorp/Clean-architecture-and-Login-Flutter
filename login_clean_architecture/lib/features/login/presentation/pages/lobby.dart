import 'package:flutter/material.dart';

class Lobby extends StatefulWidget {
  final String name;
  const Lobby({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  _LobbyState createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Text("${widget.name}"),
        ),
      ),
    );
  }
}
