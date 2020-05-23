import 'package:flutter/material.dart';
import 'package:gameofthorens/Cast.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Show extends StatefulWidget {
  final Cast cast;
  Show({this.cast});

  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.cast.person.name),
            FadeInImage(
                placeholder: AssetImage("assets/p.png"),
                image: NetworkImage(
                  widget.cast.person.image.medium,
                ))
          ],
        ),
      ),
    );
  }
}
